# Tratamiento previo

Los scripts contenidos en este documento describen el tratamiento previo de los datos del artículo *New methodology for assessing the environmental efficiency of transport: Application to the valorization of biomass from phytoremediation* de Vigil Berrocal M., Franco Vázquez L. y Marey Pérez M.

Para entender el proceso global antes de ejecutar los procedimientos aquí descritos, por favor lea el [readme](./Readme.md).

## Topología de la red

Comenzaremos transformando la geometría a un sistema de referencia proyectado.

```sql
CREATE TABLE openstreetmap.osm AS
SELECT * FROM es_2po_4pgr;
ALTER TABLE openstreetmap.osm ADD COLUMN geom_25830 geometry(LineString, 25830);
UPDATE openstreetmap.osm SET geom_25830 = ST_SETSRID(ST_TRANSFORM(geom_way, 25830),25830);
CREATE INDEX idx_openstreetmap_osm_geom ON openstreetmap.osm USING GIST(geom_25830);
ALTER TABLE openstreetmap.osm DROP COLUMN geom_way;
ALTER TABLE openstreetmap.osm ADD PRIMARY KEY(id);
```

Preparamos para pgrouting generando la topología

```sql
SELECT  pgr_createVerticesTable('openstreetmap.osm','geom_25830');
SELECT pgr_analyzeGraph('openstreetmap.osm', 0.000001,'geom_25830','id');
```

Y vamos a quedarnos con la red conectada más extensa

```sql
ALTER TABLE openstreetmap.osm ADD COLUMN longitud numeric;
UPDATE openstreetmap.osm SET longitud = ST_LENGTH(geom_25830);
CREATE TABLE openstreetmap.osm_conectada AS
SELECT arcos.*
FROM  (SELECT component,count(DISTINCT a.id) num
      FROM
        openstreetmap.osm a,
        pgr_strongComponents(
                              'SELECT id,source,target,longitud AS cost, longitud as reverse_cost FROM openstreetmap.osm'
                              ) grafos
      WHERE (source = grafos.node OR target = grafos.node)
      GROUP BY component
      ORDER BY num DESC
      LIMIT 1) recuento,
      (SELECT a.*, component
      FROM
        openstreetmap.osm a,
        pgr_strongComponents(
                              'SELECT id,source,target,longitud AS cost, longitud as reverse_cost FROM openstreetmap.osm'
                              ) grafos
      WHERE (source = grafos.node OR target = grafos.node)) arcos
WHERE arcos.component = recuento.component;
DELETE FROM openstreetmap.osm_conectada WHERE ctid NOT IN(SELECT min(ctid) FROM openstreetmap.osm_conectada GROUP BY id);
CREATE INDEX idx_openstreetmap_osm_conectada_geom ON openstreetmap.osm_conectada USING GIST(geom_25830);
ALTER TABLE openstreetmap.osm_conectada ADD PRIMARY KEY(id);
```

Preparamos para pgrouting generando la topología de la nueva capa

```sql
SELECT  pgr_createVerticesTable('openstreetmap.osm_conectada','geom_25830');
SELECT pgr_analyzeGraph('openstreetmap.osm_conectada', 0.000001,'geom_25830','id');
```

Crearemos una tabla totalmente conectada

```sql
SELECT pgr_nodeNetwork('openstreetmap.osm_conectada', 0.001,'id','geom_25830');
```

Preparamos para pgrouting generando la topología de la nueva capa

```sql
SELECT pgr_createTopology('openstreetmap.osm_conectada_noded', 0.000001,'geom_25830','id');
```

## Vértices, tipos de carreteras y alturas

Exportamos los vertices para poder cargarlos en QGIS

```shell
ogr2ogr -f GPKG osm_conectada_noded_vertices_pgr.gpkg -progress PG:"dbname=acv user=postgres password=XXX host=localhost port=5434" -sql "select * from openstreetmap.osm_conectada_noded_vertices_pgr"
```

Con esos datos, usando los datos de elevaciones procedentes de [NASA Shuttle Radar Topography Mission Global 1 arc second](https://lpdaac.usgs.gov/products/srtmgl1v003/) y la herramienta `v.drape` de QGIS podemos asignar alturas a los nodos. Para eso se genera un nuevo fichero `osm_conectada_noded_vertices_pgr_DEM.gpkg` que contiene geometrías pero con la coordenada Z. Reimportaremos esas geometrías a la base de datos:

```shell
ogr2ogr -f "PGDUMP" -lco "SCHEMA=openstreetmap" -lco "GEOMETRY_NAME=geom"  osm_conectada_noded_vertices_pgr_DEM.dump osm_conectada_noded_vertices_pgr_DEM.gpkg  &> /acv/es/errores.txt
psql -d acv -h localhost -U postgres -p 5434 -f /acv/osm_conectada_noded_vertices_pgr_DEM.dump &> /acv/errores.txt
```

Una vez exportados los datos se crea un índice en el campo **id** (`CREATE UNIQUE INDEX idx_openstreetmap_osm_conectada_noded_vertices_pgr_DEM_id ON openstreetmap.osm_conectada_noded_vertices_pgr_DEM(id)`) y se usa para actualizar los datos de pendientes

```sql
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN altura_origen numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN altura_fin numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN pendiente numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN pendiente_reversa numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN longitud numeric;
UPDATE openstreetmap.osm_conectada_noded l SET longitud = ST_LENGTH(geom_25830);

UPDATE openstreetmap.osm_conectada_noded l SET altura_origen = ST_Z(n.geom)
FROM  openstreetmap.osm_conectada_noded_vertices_pgr_DEM n
WHERE l.source = n.id;

UPDATE openstreetmap.osm_conectada_noded l SET altura_fin = ST_Z(n.geom)
FROM  openstreetmap.osm_conectada_noded_vertices_pgr_DEM n
WHERE l.target = n.id;

UPDATE openstreetmap.osm_conectada_noded
SET   pendiente = round(100*(altura_fin - altura_origen)::numeric/longitud::numeric,2);

UPDATE openstreetmap.osm_conectada_noded
SET   pendiente_reversa = round(100*(altura_origen - altura_fin)::numeric/longitud::numeric,2);
```

Actualizamos campos a partir de la tabla original

```sql
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN clazz integer;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN tipo_carretera varchar(50);
CREATE INDEX idx_openstreetmap_osm_conectada_noded_old_id
ON openstreetmap.osm_conectada_noded(old_id);

UPDATE openstreetmap.osm_conectada_noded n
SET clazz = o.clazz
FROM openstreetmap.osm_conectada o
WHERE o.id = n.old_id;

UPDATE openstreetmap.osm_conectada_noded
SET tipo_carretera = 'Highway'
WHERE clazz = 11 OR clazz = 12 OR clazz = 13 OR clazz = 14;

UPDATE openstreetmap.osm_conectada_noded
SET tipo_carretera = 'Rural'
WHERE clazz = 15 OR clazz = 16 OR clazz = 21 OR clazz = 22
      OR clazz = 31 OR clazz = 32 OR clazz = 42 OR clazz = 43;

UPDATE openstreetmap.osm_conectada_noded
SET tipo_carretera = 'Urban Peak'
WHERE clazz = 41;
```

### Grupos de pendientes de la red de carreteras

Caracterizamos los grupos de pendientes de cada tramo. Asignamos el valor de pendiente más próximo en la tabla.

```sql
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN grupo_pendiente numeric;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = -0.06
WHERE pendiente <= -5;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = -0.04
WHERE pendiente > -5 AND pendiente <= -3;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = -0.02
WHERE pendiente > -3 AND pendiente <= -1;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = 0
WHERE pendiente > -1 AND pendiente <= 1;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = 0.02
WHERE pendiente > 1 AND pendiente <= 3;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = 0.04
WHERE pendiente > 3 AND pendiente <= 5;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente = 0.06
WHERE pendiente > 5;

ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN grupo_pendiente_reversa numeric;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = -0.06
WHERE pendiente_reversa <= -5;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = -0.04
WHERE pendiente_reversa > -5 AND pendiente_reversa <= -3;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = -0.02
WHERE pendiente_reversa > -3 AND pendiente_reversa <= -1;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = 0
WHERE pendiente_reversa > -1 AND pendiente_reversa <= 1;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = 0.02
WHERE pendiente_reversa > 1 AND pendiente_reversa <= 3;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = 0.04
WHERE pendiente_reversa > 3 AND pendiente_reversa <= 5;
UPDATE openstreetmap.osm_conectada_noded SET grupo_pendiente_reversa = 0.06
WHERE pendiente_reversa > 5;
```

## Datos casos práctico

Los puntos de referencia del caso práctico.

Revisado por mi:

- Origen (Acelor): 43.555450, -5.905625
- Vertedero Estrellín: 43.57861111, -5.91694444
- Vertedero sanitario (COGERSA): 43.49083333, -5.81750000

Crearemos capa de puntos

```sql
CREATE TABLE puntos_referencia_caso_practico(
      gid serial PRIMARY KEY,
      descripcion varchar(100),
      x_4326 numeric,
      y_4326 numeric,
      geom_25830 geometry(Point, 25830)
);
INSERT INTO puntos_referencia_caso_practico(descripcion,x_4326,y_4326) VALUES('Origen (Acelor)',-5.91032034, 43.55630713);
INSERT INTO puntos_referencia_caso_practico(descripcion,x_4326,y_4326) VALUES('Vertedero Estrellín',-5.91694444, 43.57861111);
INSERT INTO puntos_referencia_caso_practico(descripcion,x_4326,y_4326) VALUES('Vertedero sanitario (COGERSA)',-5.81900460, 43.50115519);
UPDATE puntos_referencia_caso_practico SET geom_25830 = ST_SETSRID(ST_TRANSFORM(ST_SETSRID(ST_MAKEPOINT(x_4326,y_4326),4326),25830),25830);

CREATE INDEX idx_puntos_referencia_caso_practico_geom_25830 ON puntos_referencia_caso_practico USING GIST(geom_25830);
```

Los nodos que referencian cada punto se pueden calcular como sigue:

```sql
SELECT 
      DISTINCT ON (p.gid)
      p.*,
      o.fid
FROM  puntos_referencia_caso_practico p,
      openstreetmap.osm_conectada_noded_vertices_pgr_dem o
ORDER BY p.gid, ST_DISTANCE(p.geom_25830,o.geom) ASC
```

- gid nodo origen : 787650
- Vertedero Estrellín: 689067
- Vertedero sanitario (COGERSA): 1122073

## Coste a carga completa

Creamos nuevas columnas para calcular los costes sin carga y a carga completa.

```sql
--De este modo todos los arcos que no entren en los parámetros tendrán una impedancia muy alta
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN coste_sin_carga numeric DEFAULT 9999999999999999999999999999999999;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN ec_sin_carga numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN n20_sin_carga numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN ch4_sin_carga numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN coste_carga_completa numeric DEFAULT 9999999999999999999999999999999999;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN ec_carga_completa numeric;

--Coste directo
UPDATE openstreetmap.osm_conectada_noded n SET ec_sin_carga = ef
FROM  parametros_acv p
WHERE p.pollutant = 'EC'
      AND load = 0
      AND grupo_pendiente = road_slope
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR';
UPDATE openstreetmap.osm_conectada_noded n SET n20 = ef
FROM  parametros_acv p
WHERE p.pollutant = 'N2O'
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR'
      AND tipo_carretera = p.mode;
UPDATE openstreetmap.osm_conectada_noded n SET ch4 = ef
FROM  parametros_acv p
WHERE p.pollutant = 'CH4'
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR'
      AND tipo_carretera = p.mode;
UPDATE openstreetmap.osm_conectada_noded SET coste_sin_carga = (ec_sin_carga*0.07422+ch4*0.028+n20*0.265)*(longitud::numeric/1000::numeric);
UPDATE openstreetmap.osm_conectada_noded SET coste_sin_carga = 9999999999999999999999999999999999
WHERE coste_sin_carga IS NULL;

UPDATE openstreetmap.osm_conectada_noded n SET ec_carga_completa = ef
FROM  parametros_acv p
WHERE p.pollutant = 'EC'
      AND load = 1
      AND grupo_pendiente = road_slope
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR';
UPDATE openstreetmap.osm_conectada_noded SET coste_carga_completa = (ec_carga_completa*0.07422+ch4*0.028+n20*0.265)*(longitud::numeric/1000::numeric);
UPDATE openstreetmap.osm_conectada_noded SET coste_carga_completa = 9999999999999999999999999999999999
WHERE coste_carga_completa IS NULL;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN coste_reverso_carga_completa numeric;
ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN ec_reverso_carga_completa numeric;
UPDATE openstreetmap.osm_conectada_noded n SET ec_reverso_carga_completa = ef
FROM  parametros_acv p
WHERE p.pollutant = 'EC'
      AND load = 1
      AND grupo_pendiente_reversa = road_slope
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR';
```

Las de 1 sentido tienen reverse_cost = 1000000 en la tabla original;

```sql
UPDATE openstreetmap.osm_conectada_noded n
SET coste_reverso_carga_completa = o.reverse_cost
FROM openstreetmap.osm_conectada o
WHERE o.id = n.old_id;
UPDATE openstreetmap.osm_conectada_noded SET coste_reverso_carga_completa = 9999999999999999999999999999999999
WHERE coste_reverso_carga_completa = 1000000;

UPDATE openstreetmap.osm_conectada_noded SET coste_reverso_carga_completa = NULL
WHERE coste_reverso_carga_completa <> 9999999999999999999999999999999999;

UPDATE openstreetmap.osm_conectada_noded
SET coste_reverso_carga_completa = (ec_reverso_carga_completa*0.07422+ch4*0.028+n20*0.265)*(longitud::numeric/1000::numeric)
WHERE coste_reverso_carga_completa IS NULL;

ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN coste_reverso_sin_carga numeric;
UPDATE openstreetmap.osm_conectada_noded n
SET coste_reverso_sin_carga = o.reverse_cost
FROM openstreetmap.osm_conectada o
WHERE o.id = n.old_id;
UPDATE openstreetmap.osm_conectada_noded SET coste_reverso_sin_carga = 9999999999999999999999999999999999
WHERE coste_reverso_sin_carga = 1000000;

UPDATE openstreetmap.osm_conectada_noded SET coste_reverso_sin_carga = NULL
WHERE coste_reverso_sin_carga <> 9999999999999999999999999999999999;

ALTER TABLE openstreetmap.osm_conectada_noded ADD COLUMN ec_reverso_sin_carga numeric;
UPDATE openstreetmap.osm_conectada_noded n SET ec_reverso_sin_carga = ef
FROM  parametros_acv p
WHERE p.pollutant = 'EC'
      AND load = 0
      AND grupo_pendiente_reversa = road_slope
      AND euros_standard_technology = 'Euro IV'
      AND technology = 'SCR'
      AND coste_reverso_sin_carga IS NULL;

UPDATE openstreetmap.osm_conectada_noded
SET coste_reverso_sin_carga = (ec_reverso_sin_carga*0.07422+ch4*0.028+n20*0.265)*(longitud::numeric/1000::numeric)
WHERE coste_reverso_sin_carga IS NULL;
```

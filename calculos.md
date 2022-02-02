# Cálculos

Los scripts contenidos en este documento describen los cálculos llevados a cabo para el artículo *New methodology for assessing the environmental efficiency of transport: Application to the valorization of biomass from phytoremediation* de Vigil Berrocal M., Franco Vázquez L. y Marey Pérez M.

Para entender el proceso global antes de ejecutar los procedimientos aquí descritos, por favor lea el [readme][Readme.md].

## Establecer coste a carga completa

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

Crearemos una tabla con todos los nodos a los que se puede llegar en un entorno de X coste.

```sql
CREATE TABLE openstreetmap.nodos_entorno_origen_caso_practico AS
SELECT  node AS id_nodo, agg_cost
FROM   pgr_drivingDistance('SELECT id,source,target,
                        coste_carga_completa AS cost, coste_reverso_carga_completa reverse_cost
                     FROM openstreetmap.osm_conectada_noded',
                     787650,350
                     )  
;
```

Para evitar calcular distancias a todos los nodos de la red emplearemos está tabla, que nos proporciona el listado de nodos potenciales del entorno.

## Cálculo de rutas óptimas

Comenzaremos inicializando una tabla con los resultados a los nodos más próximos.

```sql
CREATE SCHEMA euro_iv;
CREATE TABLE euro_iv.carga_completa_osm_noded_caso_practico AS
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge AS edge_id,node
FROM   pgr_dijkstra('SELECT id,source,target,coste_carga_completa AS cost,
                            coste_reverso_carga_completa as reverse_cost
                     FROM openstreetmap.osm_conectada_noded',
                     787650,
                     (
                        SELECT array_agg(id_nodo)
                        FROM (SELECT id_nodo
                                FROM
                                    openstreetmap.nodos_entorno_origen_caso_practico
                                ORDER BY id_nodo
                                LIMIT 7500
                                ) d
                     )
                    )           AS s
;
```

A continuación se debe ejecutar el script [consultas_osm_caso_practico_carga_100_IDA.sql](./scripts/consultas_osm_caso_practico_carga_100_IDA.sql).

Crearemos un nuevo campo con el sentido de la ruta (1: ida; 2: vuelta)

```sql
ALTER TABLE euro_iv.carga_completa_osm_noded_caso_practico ADD COLUMN sentido INTEGER DEFAULT 2;
UPDATE euro_iv.carga_completa_osm_noded_caso_practico SET sentido = 1;
```

E introduciremos los datos para la vuelta

```sql
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico(end_vid,
      seq,path_seq,
      coste,
      coste_agregado,
      edge_id, node)
SELECT
      start_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge AS edge_id,node
FROM   pgr_dijkstra('SELECT id,source,target,coste_sin_carga AS cost, coste_reverso_sin_carga as reverse_cost
                     FROM openstreetmap.osm_conectada_noded',
                     (
                        SELECT array_agg(id_nodo)
                        FROM (SELECT id_nodo
                                FROM
                                    openstreetmap.nodos_entorno_origen_caso_practico
                                ORDER BY id_nodo
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
```

El resto de los nodos los metemos mediante las consultas presentes en [consultas_osm_caso_practico_carga_100_VUELTA.sql](./scripts/consultas_osm_caso_practico_carga_100_VUELTA.sql).

Ahora crearemos un campo nuevo con la secuencia de pasos completa:

```sql
CREATE INDEX idx_euro_iv_carga_completa_osm_noded_caso_practico_end_vid ON euro_iv.carga_completa_osm_noded_caso_practico(end_vid);
CREATE INDEX idx_euro_iv_carga_completa_osm_noded_caso_practico_edge_id
ON euro_iv.carga_completa_osm_noded_caso_practico(edge_id);
```

```sql
ALTER TABLE euro_iv.carga_completa_osm_noded_caso_practico ADD COLUMN path_seq_completa INTEGER;
UPDATE euro_iv.carga_completa_osm_noded_caso_practico SET path_seq_completa = path_seq WHERE sentido = 1;
UPDATE euro_iv.carga_completa_osm_noded_caso_practico o
SET path_seq_completa = path_seq + maximo
FROM
      (SELECT end_vid, max(path_seq) maximo
      FROM euro_iv.carga_completa_osm_noded_caso_practico
      WHERE sentido = 1
      GROUP BY end_vid) m
WHERE m.end_vid = o.end_vid AND sentido = 2;
```

Y actualizaremos el coste agregado

```sql
UPDATE euro_iv.carga_completa_osm_noded_caso_practico o
SET coste_agregado = coste_agregado + maximo
FROM
      (SELECT end_vid, max(coste_agregado) maximo
      FROM euro_iv.carga_completa_osm_noded_caso_practico
      WHERE sentido = 1
      GROUP BY end_vid) m
WHERE m.end_vid = o.end_vid AND sentido = 2;
```

Nos sobran los casos por encima de 10000, que indican paso por sentidos imposibles.

```sql
DELETE 
FROM  euro_iv.carga_completa_osm_noded_caso_practico o
USING
      (SELECT end_vid
       FROM euro_iv.carga_completa_osm_noded_caso_practico
       WHERE coste_agregado > 10000
       GROUP BY end_vid) f
WHERE o.end_vid = f.end_vid;
```
# New methodology for assessing the environmental efficiency of transport: Application to the valorization of biomass from phytoremediation

Este repositorio contiene los scripts y consultas empleados en los cálculos del artículo *New methodology for assessing the environmental efficiency of transport: Application to the valorization of biomass from phytoremediation* de Vigil Berrocal M., Franco Vázquez L. y Marey Pérez M.

Para poder ejecutarlos se precisa de una base de datos postgresql con las extensiones postgis (3+) y pgrouting instaladas, java, QGIS y un terminal de shell. 

## Datos empleados

Tal y como se expone en el artículo se emplearon datos de openstreetmaps, scripts en bash, SQL y R. Este es un resumen del proceso. 

Los datos de openstreetmaps se descargaron de [geofabrik](https://download.geofabrik.de/europe.html). Se descargaron solo datos de España y Portugal.

Para incorporarlos a la base de datos (postgis) se empleará [osm2po](https://osm2po.de/) y para eliminar los metadatos y reducir el peso innecesario se usará [Osmconvert](https://wiki.openstreetmap.org/wiki/Osmconvert)

En un sistema debia/ubuntu el proceso de incorporalos a la base de datos sería como sigue

```shell
sudo apt install osmctools
osmconvert portugal-latest.osm.pbf --drop-author --drop-version --out-osm -o=portugal_data_reduc.osm
osmconvert spain-latest.osm.pbf --drop-author --drop-version --out-osm -o=spain_data_reduc.osm
```

Primero crearemos un esquema para osm

```sql
CREATE SCHEMA openstreetmap;
```

E importamos

```shell
java -Xmx8g -jar osm2po-core-5.2.43-signed.jar prefix=es tileSize=x workDir=/acv/es ~/acv/osm/spain_data_reduc.osm postp.0.class=de.cm.osm2po.plugins.postp.PgRoutingWriter
psql -U postgres -p 5434 -h localhost -d acv -q -f "es_2po_4pgr.sql"
```

Una vez que disponemos de estos datos podemos realizar el [tratamiento previo](tratamiento_previo.md) y [realizar los cálculos](calculos.md).

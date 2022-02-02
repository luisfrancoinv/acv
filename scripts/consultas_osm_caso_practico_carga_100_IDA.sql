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

INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 7500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 15000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 22500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 30000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 37500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 45000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 52500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 60000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 67500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 75000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 82500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 90000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 97500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 105000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 112500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 120000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 127500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 135000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 142500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 150000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 157500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 165000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 172500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 180000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 187500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 195000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 202500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 210000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 217500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 225000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 232500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 240000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 247500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 255000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 262500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 270000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 277500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 285000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 292500
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;
INSERT INTO euro_iv.carga_completa_osm_noded_caso_practico
SELECT
      end_vid,
      seq,path_seq,
      s.cost AS coste,
      agg_cost as coste_agregado,
      edge,node
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
                                OFFSET 300000
                                LIMIT 7500
                                ) d
                     )
        )   AS s
;

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
                                offset 7500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 15000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 22500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 30000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 37500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 45000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 52500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 60000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 67500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 75000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 82500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 90000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 97500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 105000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 112500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 120000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 127500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 135000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 142500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 150000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 157500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 165000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 172500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 180000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 187500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 195000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 202500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 210000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 217500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 225000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 232500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 240000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 247500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 255000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 262500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 270000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 277500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 285000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 292500
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;
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
                                offset 300000
                                LIMIT 7500
                                ) d
                     ),
                     787650)                     AS s
        LEFT JOIN openstreetmap.osm_conectada_noded AS a ON a.id = edge
;

/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS orden_table;

CREATE TABLE orden_table (letra       STRING,
                    fecha       DATE,
                    numero       INT)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA INPATH "data.tsv" OVERWRITE INTO TABLE orden_table;

SELECT *
FROM orden_table
ORDER BY
    letra, fecha, numero;

INSERT OVERWRITE LOCAL DIRECTORY 'output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

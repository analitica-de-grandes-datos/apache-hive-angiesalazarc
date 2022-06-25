/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS count_words;

CREATE TABLE count_words (letra       STRING,
                          fecha       DATE,
                          numero       INT)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA INPATH 'data.tsv' OVERWRITE INTO TABLE count_words;

    SELECT letra, count(1) AS count
    FROM
        count_words
GROUP BY
    letra
ORDER BY
    letra;

INSERT OVERWRITE LOCAL DIRECTORY 'output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

    

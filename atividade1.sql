CREATE DATABASE primeiro;

CREATE TABLE funcionario(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    salario NUMERIC(8,2),
    cod_depto INTEGER
);

INSERT INTO
  funcionario
  (codigo, nome, salario, cod_depto)
VALUES
  (1, 'Adam', 1300, 1),
  (2, 'Smith', 800, 1),
  (3, 'Jean', 700, 2),
  (4, 'Ben', 1100, 2),
  (5, 'Juan', 1500, 1),
  (6, 'Thomas', 350, 3),
  (7, 'Edy', 600, 2),
  (8, 'Bill', 900, 2),
  (9, 'Marie', 1900, 2),
  (10, 'Julie', 3200, 3);

SELECT 
    nome, salario 
FROM 
    funcionario;

UPDATE 
    funcionario 
SET 
    salario=salario*1.20 
WHERE 
    cod_depto = 1;

SELECT 
    * 
FROM 
    funcionario 
WHERE 
    cod_depto=1 
    AND salario>1000;

DELETE FROM 
    funcionario 
WHERE 
    cod_depto=3;

SELECT 
    * 
FROM 
    funcionario;

COPY funcionario TO 'Users\laura perera\Desktop\saidaAtividade1.txt' WITH DELIMITER '|';

DELETE FROM 
    funcionario;

COPY funcionario FROM 'c:\Users\laura perera\Desktop\saidaAtividade1.txt' WITH DELIMITER '|';
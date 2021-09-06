--Crie uma base de dados chamada primeiro
REATE DATABASE primeiro;

--Crie uma tabela chamada funcionario, dentro da base criada acima, com os seguintes atributos:
CREATE TABLE funcionario(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    salario NUMERIC(8,2),
    cod_depto INTEGER
);

--Insira as linhas abaixo na tabela funcionario
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


--Liste o nome do funcionário e o seu salário
SELECT 
    nome, salario 
FROM 
    funcionario;

--Aumente em 20% o salário de todos os funcionários lotados no departamento 1
UPDATE 
    funcionario 
SET 
    salario=salario*1.20 
WHERE 
    cod_depto = 1;

--Liste todos os funcionários lotados no departamento 1 com salário superior a 1000
SELECT 
    * 
FROM 
    funcionario 
WHERE 
    cod_depto=1 
    AND salario>1000;

--Delete todos os funcionários do departamento 3
DELETE FROM 
    funcionario 
WHERE 
    cod_depto=3;

--Liste todos os funcionários novamente
SELECT 
    * 
FROM 
    funcionario;

--Gere um arquivo texto baseado na tabela funcionario
COPY funcionario TO 'Users\laura perera\Desktop\saidaAtividade1.txt' WITH DELIMITER '|';

--Apague todas as linhas da tabela funcionario
DELETE FROM 
    funcionario;

--Importe o arquivo texto gerado anteriormente para a tabela funcionario
COPY funcionario FROM 'c:\Users\laura perera\Desktop\saidaAtividade1.txt' WITH DELIMITER '|';
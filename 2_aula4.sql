CREATE TABLE func_1(
	cod_func INTEGER PRIMARY KEY,
  	nome_fun VARCHAR(100),
  	salario_fun NUMERIC (8,2),
  	cod_sup INTEGER REFERENCES func_1
);

INSERT INTO 
	func_1 
VALUES 
	(1,'A',3000,NULL),
	(2,'B',800,1),
	(3,'C',600,1),
	(4,'D',300,1),
	(5,'E',3000,NULL),
	(6,'F',450,5),
	(7,'G',400,5),
	(8,'H',700,5),
	(9,'I',900,5),
	(10, 'J',3000,NULL),
	(11,'K',1000,10),
	(12,'L',1300,10);

--Mostre o nome do supervisor e o seu supervisionado
SELECT 
	f.nome_fun AS supervisor, f1.nome_fun AS supervisionado
FROM
	func_1 f, func_1 f1
WHERE
	f1.cod_sup = f.cod_func;
  
--Mostre somente o nome dos supervisores
SELECT 
	nome_fun AS supervisor
FROM
	func_1
WHERE
	cod_sup IS NULL;

--Mostre o nome do supervisor e a quantidade de supervisionados
SELECT 
	f.nome_fun AS supervisor, COUNT(f1.cod_sup) AS supervisionados
FROM
	func_1 f, func_1 f1
WHERE
	f.cod_sup IS NULL
	AND f.cod_func = f1.cod_sup
GROUP BY 
	f.nome_fun
ORDER BY
	f.nome_fun;

--Mostre o nome do supervisor e o maior salário de cada funcionário supervisionado por este
SELECT
	f.nome_fun AS supervisor, MAX(f1.salario_fun)
FROM
	func_1 f, func_1 f1
WHERE
	f.cod_sup IS NULL
	AND f.cod_func = f1.cod_sup
GROUP BY
	f.nome_fun;
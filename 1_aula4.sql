CREATE database exerc1_aula4;

--Crie a tabela abaixo com o nome de PESSOA2 e insira os dados
CREATE TABLE pessoa2(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(100),
	cod_conjuge INTEGER REFERENCES pessoa2,
	cod_pai INTEGER REFERENCES pessoa2,
	cod_mae INTEGER REFERENCES pessoa2
);

INSERT INTO
	pessoa2
VALUES
	(1, 'ADAO', 2, NULL, NULL),
	(2, 'EVA', 1, NULL, NULL),
	(3, 'EVINHA', 5, 1, 2),
	(4, 'ADAOZINHO', 6, 1, 2),
	(5, 'JUCA', 3, NULL, NULL),
	(6, 'MARIA', 4, NULL, NULL),
	(7, 'ADAOZINHO1', NULL, 4, 6),
	(8, 'ADAOZINHO2', NULL, 4, 6),
	(9, 'EVINHA1', NULL, 5, 3),
	(10, 'EVINHA2', NULL, 5, 3),
	(11, 'ADAOZINHO3', NULL, 4, 6);



--Mostre os nomes dos casais.
SELECT
	p.nome, p1.nome
FROM
	pessoa2 p, pessoa2 p1
WHERE
	p.codigo = p1.cod_conjuge;


--Mostre os nomes dos irmãos do ADAOZINHO3.
SELECT
	p1.nome AS irmãos
FROM
	pessoa2 p, pessoa2 p1
WHERE
	p.codigo = 11
  AND p1.cod_pai = p.cod_pai
  AND p1.cod_mae = p.cod_mae;

--Mostre os nomes dos primos do ADAOZINHO3.
SELECT
	p3.nome AS primos
FROM
	pessoa2 p, pessoa2 p1, pessoa2 p2, pessoa2 p3
WHERE
	p.codigo = 11
    AND p1.codigo = p.cod_pai
    AND p1.cod_pai = p2.cod_pai
    AND p2.codigo = p3.cod_mae;

--Mostre os nomes dos tios do ADAOZINHO3
SELECT
	p.nome AS tios
FROM
	pessoa2 p, pessoa2 p1, pessoa2 p2
WHERE
	p1.codigo = 11
    AND p2.codigo = p1.cod_pai
    AND p.cod_pai = p2.cod_pai
   	AND NOT p1.cod_pai = p.codigo;

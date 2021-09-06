CREATE TABLE estados(
    sigla CHAR(2),
    nome CHAR(50),
    area_total REAL
);

CREATE TABLE cidades(
    cidade CHAR(50),
    uf CHAR(2),
    populacao INT,
    area_km REAL
);

INSERT INTO 
    estados
    (sigla, nome, area_total)
VALUES
    ('RS', 'Rio Grande do Sul', 0),
    ('SC', 'Santa Catarina', 0),
    ('PR', 'Parana', 0),
    ('SP', 'Sao Paulo', 0);
	
SELECT * FROM cidades;
	
INSERT INTO 
    cidades
    (cidade, uf, populacao, area_km)
VALUES
    ('Bage', 'RS', 97765, 4096),
    ('Dom Pedrito', 'RS', 38898, 5192), 
    ('Acegua', 'RS', 1502, 1502),
    ('Hulha Negra', 'RS', 6521, 822),
    ('Florianopolis', 'SC', 248477, 436),
    ('Tubarao', 'SC', 102833, 300),
    ('Criciuma', 'SC', 133031, 235),
    ('Curitiba', 'PR', 1752000, 430), 
    ('Sao Jose dos Pinhais', 'PR', 200521, 931),
    ('Sao Paulo', 'SP', 1040456, 1521);
	
SELECT 
    * 
FROM estados;

SELECT 
    populacao, area_km, cidade 
FROM 
    CIDADES 
ORDER BY 1 ASC
 
SELECT 
    SUM(populacao) 
FROM   
    cidades GROUP BY uf;
 
SELECT 
    cidade, uf, populacao 
FROM 
    cidades 
ORDER BY 
    uf, populacao ASC;

SELECT 
    cidade 
FROM 
    cidades 
GROUP BY   
    cidade 
ORDER BY 
    MAX(populacao) DESC LIMIT 1;
 
SELECT 
    AVG(populacao), uf AS media_habitantes 
FROM 
    cidades 
GROUP BY 
    uf;
 
SELECT 
    cidade 
FROM 
    cidades 
GROUP BY 
    cidade 
ORDER BY 
    MIN(populacao) ASC LIMIT 1;
  
SELECT 
    SUM(area_km), uf AS area_total 
FROM 
    cidades 
GROUP BY uf;
 
UPDATE 
    estados 
SET 
    area_total = (SELECT SUM(area_km) 
FROM 
    cidades 
WHERE 
    uf = sigla);
 
 
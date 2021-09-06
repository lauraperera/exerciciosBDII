CREATE DATABASE clinica;

CREATE TABLE especialidade(
	codigo_esp INTEGER PRIMARY KEY,
	nome_esp VARCHAR(30)
);

CREATE TABLE medico(
	codigo_med INTEGER PRIMARY KEY,
	nome_med VARCHAR(30),
	codigo_esp INTEGER,
	FOREIGN KEY (codigo_esp) REFERENCES especialidade(codigo_esp)
);

CREATE TABLE paciente(
	codigo_pac INTEGER PRIMARY KEY,
	nome_pac VARCHAR(30),
	datanasc_pac DATE
);

CREATE TABLE consulta(
	codigo_pac INTEGER,
	FOREIGN KEY (codigo_pac) REFERENCES paciente(codigo_pac),
	codigo_med INTEGER,
	FOREIGN KEY (codigo_med) REFERENCES medico(codigo_med),
	data_con DATE,
	hora_con TIME
);

--Com o comando copy importe os arquivos
COPY especialidade FROM 'C:\Users\laura perera\Desktop\Atividade 3 - BDII\especialidade.csv' WITH DELIMITER ',';

COPY medico FROM 'C:\Users\laura perera\Desktop\Atividade 3 - BDII\medico.csv' WITH DELIMITER ',';

COPY paciente FROM 'C:\Users\laura perera\Desktop\Atividade 3 - BDII\paciente.csv' WITH DELIMITER ',';

COPY consulta FROM 'C:\Users\laura perera\Desktop\Atividade 3 - BDII\consulta.csv' WITH DELIMITER ',';

--Mostre o nome do médico e sua especialidade
SELECT m.nome_med, e.codigo_esp, e.nome_esp 
	FROM medico m, especialidade e
	WHERE e.codigo_esp = m.codigo_esp

--Mostre a especialidade e a quantidade de médicos de cada uma delas
SELECT e.nome_esp, e.codigo_esp, COUNT (m.codigo_esp) AS quantidade_medicos
	FROM especialidade e, medico m
	WHERE m.codigo_esp = e.codigo_esp
	GROUP BY e.nome_esp, e.codigo_esp
	ORDER BY e.codigo_esp ASC


--Mostre o nome e a data de nascimento do paciente mais novo
SELECT codigo_pac, nome_pac, datanasc_pac
	FROM paciente
	ORDER BY datanasc_pac DESC
	LIMIT 1

--Mostre o nome e a data de nascimento do paciente mais velho 
SELECT codigo_pac, nome_pac, datanasc_pac
	FROM paciente
	ORDER BY datanasc_pac ASC
	LIMIT 1


--Mostre a quantidade de consulta de cada dia.
SELECT data_con	AS dia_consulta, COUNT(data_con) AS quantidade_consulta
	FROM consulta
	GROUP BY data_con
	
	
--Mostre a quantidade de consultas de cada médico.
SELECT m.nome_med, COUNT(c.codigo_med) AS quantidade_consulta
	FROM consulta c, medico m
	WHERE m.codigo_med = c.codigo_med
	GROUP BY m.nome_med
	
--Mostre a quantidade de consultas de cada paciente.
SELECT p.nome_pac, COUNT(c.codigo_pac)AS quantidade_consulta
	FROM consulta c, paciente p
	WHERE p.codigo_pac = c.codigo_pac
	GROUP BY p.nome_pac
	
-- Mostre a quantidade de consultas por data e médico.
SELECT 
    m.nome_med, c.data_con, COUNT(c.codigo_med) AS quantidade_consulta
FROM 
    consulta c, medico m
WHERE 
    m.codigo_med = c.codigo_med
GROUP BY 
    m.nome_med, c.data_con
	
--Mostre os pacientes que nunca efetuaram uma consulta.
SELECT 
    p.nome_pac, p.codigo_pac 
FROM 
    paciente p
WHERE 
	NOT EXISTS(
		SELECT 
            codigo_pac 
		FROM 
            consulta c
		WHERE 
            c.codigo_pac = p.codigo_pac
    );
				
				
-- Mostre o nome do paciente, o nome do medico, a sua especialidade, a data e a hora de cada consulta.
SELECT 
    p.nome_pac, m.nome_med, e.nome_esp, c.data_con, c.hora_con
FROM 
    consulta c, especialidade e, medico m, paciente p
WHERE 
	p.codigo_pac = c.codigo_pac 
	AND m.codigo_med = c.codigo_med
	AND e.codigo_esp = m.codigo_esp;
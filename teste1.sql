CREATE DATABASE saude_comunidade;
USE saude_comunidade;

CREATE TABLE pacientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    genero ENUM('M', 'F', 'Outro'),
    endereco VARCHAR(2550),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE diagnosticos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    descricao TEXT,
    data_diagnostico DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

CREATE TABLE tratamentos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    diagnostico_id INT,
    descriçao TEXT,
    data_inicio DATE,
    data_fim DATE,
    profisional_id INT,
    FOREIGN KEY (diagnostico_id) REFERENCES diagnosticos_id,
    FOREIGN KEY (profissional_id) REFERENCES profissionais_id
);

CREATE TABLE exames (
	id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    tipo_exame VARCHAR(100),
    resultados TEXT,
    data_exame DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

CREATE TABLE historico_medico (
	id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    descricao TEXT,
    data_registro DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

CREATE TABLE profissionais (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE instituicoes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE profissionais_instituicoes (
	profissional_id INT,
    instituicao_id INT,
    PRIMARY KEY (profissional_id, instituicao_id),
    FOREIGN KEY (profissional_id) REFERENCES profissionais(id),
    FOREIGN KEY (instituicao_id) REFERENCES instituicao(id)
);

INSERT INTO pacientes (paciente_id, nome, data_nascimento, genero, endereco, telefone, email)
VALUES (1, 'João Silva', '15/01/1980', 'M', 'Rua A, 123', '1234-5678', 'joao43@hotmail.com'),
VALUES (2, 'Pedro Santos', '29/06/1994', 'M', 'Rua São Jorge 48', '6841-8733', 'psantos1@gmail.com');

INSERT INTO profissionais (profissional_id, nome, especialidade, telefone, email)
VALUES (1, 'Dra. Maria Santos', 'Cardiologista', '9876-5432', 'maria08@email.com'),
VALUES (2, 'Dr. Victor Pereira', 'Fisioterapeura', '9310-5291', 'victorp12@hotmail.com');

INSERT INTO diagnosticos (paciente_id, diagnostico_id, descricao, data_diagnostico)
VALUES (1, 1, 'Com base nos resultados dos exames clínicos, laboratoriais e de imagem, o cardiologista pode identificar uma ou mais condições cardíacas.', '07/02/2022'),
VALUES (2, 2, 'Com base na avaliação, o fisioterapeuta identifica a(s) disfunção(ões) presente(s).', '12/06/2021');

INSERT INTO tratamentos (diagnostico_id, descricao, data_inicio, data_fim, profissional_id)
VALUES (1, 'Com base nos resultados dos exames clínicos, laboratoriais e de imagem, o cardiologista pode identificar uma ou mais condições cardíacas.', '14/03/2022', '14/05/2022', 1),
VALUES (2, 'Com base na avaliação, o fisioterapeuta identifica a(s) disfunção(ões) presente(s).', '20/07/2021', '23/08/2021', 2);

INSERT INTO exames (paciente_id, tipo_exame, data_exame)
VALUES (1, 'Cirurgia de revascularização miocardíaca', 25/05/2022),
VALUES (2, 'Testes de reflexos, sensibilidade, e função nervosa para avaliar a integridade do sistema nervoso', 18/05/2022);

INSERT INTO historico_medico (paciente_id, descricao, data_registro)
VALUES (1, 'Com base nos resultados dos exames clínicos, laboratoriais e de imagem, o cardiologista pode identificar uma ou mais condições cardíacas.', 02/02/2022),
VALUES (2, 'Com base na avaliação, o fisioterapeuta identifica a(s) difusão(ões) presente(s).', 08/06/2021);

INSERT INTO instituicoes (instituicoes_id, nome, endereco, telefone, email)
VALUES (1, 'Laboratório Santos Drumont', 'Rua Riacho Doce', '0937-1855', 'labsantosdrumont@gmail.com'),
VALUES (2, 'Hospital Ricardo de Almeida', 'Av. Piauí', '5573-9406', 'hricardoalmeida@hotmil.com');

INSERT INTO profissionais_instituicao (profissional_id, instituicao_id)
VALUES (1, 1),
VALUES (2, 2);
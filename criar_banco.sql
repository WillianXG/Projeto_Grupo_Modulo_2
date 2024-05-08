CREATE SCHEMA IF NOT EXISTS resilia;

SET search_path TO resilia;

CREATE TABLE Estudante (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100),
    telefone VARCHAR(20),
    status_evasao BOOLEAN,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES Turma(ID)
);

CREATE TABLE Facilitador (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    especializacao VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Turma (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    id_curso INT,
    id_facilitador INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(ID),
    FOREIGN KEY (id_facilitador) REFERENCES Facilitador(ID)
);

CREATE TABLE Modulo (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(ID)
);

CREATE TABLE Curso (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);



--exemplos para inserção
INSERT INTO Estudante (nome, idade, email, telefone, status_evasao, id_turma)
VALUES ('João', 20, 'joao@email.com', '123456789', FALSE, 1);

INSERT INTO Facilitador (nome, especializacao, email, telefone)
VALUES ('Maria', 'Matemática', 'maria@email.com', '987654321');

INSERT INTO Curso (nome, descricao)
VALUES ('Matemática Básica', 'Curso introdutório de matemática.');

INSERT INTO Turma (nome, descricao, id_curso, id_facilitador)
VALUES ('Turma A', 'Turma de matemática básica', 1, 1);

INSERT INTO Modulo (nome, descricao, id_curso)
VALUES ('Introdução à Aritmética', 'Números inteiros, operações básicas, etc.', 1);

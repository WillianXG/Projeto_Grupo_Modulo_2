CREATE SCHEMA IF NOT EXISTS resilia;

SET search_path TO resilia;

CREATE TABLE Curso (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    duracao_meses INT,
    qtd_modulo INT
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



CREATE TABLE Especializacao (
    ID_especializao serial primary key,
    nome_especializao varchar(200),
    FOREIGN KEY (id_facilitador) REFERENCES Facilitador(ID)
    
);



CREATE TABLE Modulo (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(ID)
);



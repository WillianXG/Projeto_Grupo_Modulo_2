CREATE SCHEMA IF NOT EXISTS resilia;

SET search_path TO resilia;

CREATE TABLE Curso (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    duracao_meses INT NOT NULL,
    qtd_modulo INT NOT NULL
);

CREATE TABLE Especializacao (
    ID_especializao SERIAL PRIMARY KEY,
    nome_especializacao VARCHAR(200) NOT NULL,
	descricao_especializacao VARCHAR(200) NOT NULL
);

CREATE TABLE Facilitador (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ID_especializacao INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_especializacao) REFERENCES Especializacao(ID_especializao)
);

CREATE TABLE Turma (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    id_curso INT NOT NULL,
    id_facilitador INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(ID),
    FOREIGN KEY (id_facilitador) REFERENCES Facilitador(ID)
);

CREATE TABLE Estudante (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cpf VARCHAR(20) UNIQUE NOT NULL,
    status_evasao BOOLEAN NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(ID)
);

CREATE TABLE Modulo (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(ID)
);

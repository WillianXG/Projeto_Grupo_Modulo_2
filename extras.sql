-- Função para visualizar os cursos
CREATE OR REPLACE FUNCTION listar_cursos()
RETURNS TABLE (
    curso_id INT,
    nome_curso VARCHAR(100),
    descricao_curso TEXT,
    duracao_meses INT,
    quantidade_modulos INT
) AS $$
BEGIN
    RETURN QUERY SELECT ID, nome, descricao, duracao_meses, qtd_modulo FROM Curso;
END;
$$ LANGUAGE plpgsql;

-- Função para visualizar os módulos de um curso específico
CREATE OR REPLACE FUNCTION listar_modulos(curso_id INT)
RETURNS TABLE (
    modulo_id INT,
    nome_modulo VARCHAR(100),
    descricao_modulo TEXT
) AS $$
BEGIN
    RETURN QUERY SELECT ID, nome, descricao FROM Modulo WHERE id_curso = curso_id;
END;
$$ LANGUAGE plpgsql;

-- Função para visualizar as especializações
CREATE OR REPLACE FUNCTION listar_especializacoes()
RETURNS TABLE (
    especializacao_id INT,
    nome_especializacao VARCHAR(200),
    descricao_especializacao VARCHAR(200)
) AS $$
BEGIN
    RETURN QUERY SELECT ID_especializao, nome_especializacao, descricao_especializacao FROM Especializacao;
END;
$$ LANGUAGE plpgsql;

-- Função para visualizar os facilitadores
CREATE OR REPLACE FUNCTION listar_facilitadores()
RETURNS TABLE (
    facilitador_id INT,
    nome_facilitador VARCHAR(100),
    especializacao_facilitador VARCHAR(200),
    email_facilitador VARCHAR(100),
    telefone_facilitador VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY 
        SELECT f.ID, f.nome, e.nome_especializacao, f.email, f.telefone
        FROM Facilitador f
        JOIN Especializacao e ON f.ID_especializacao = e.ID_especializao;
END;
$$ LANGUAGE plpgsql;

-- Função para visualizar as turmas
CREATE OR REPLACE FUNCTION listar_turmas()
RETURNS TABLE (
    turma_id INT,
    nome_turma VARCHAR(100),
    descricao_turma TEXT,
    curso_turma VARCHAR(100),
    facilitador_turma VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
        SELECT t.ID, t.nome, t.descricao, c.nome, f.nome
        FROM Turma t
        JOIN Curso c ON t.id_curso = c.ID
        JOIN Facilitador f ON t.id_facilitador = f.ID;
END;
$$ LANGUAGE plpgsql;

-- Função para visualizar os estudantes de uma turma específica
CREATE OR REPLACE FUNCTION listar_estudantes(turma_id INT)
RETURNS TABLE (
    estudante_id INT,
    nome_estudante VARCHAR(100),
    idade_estudante INT,
    email_estudante VARCHAR(100),
    telefone_estudante VARCHAR(20),
    cpf_estudante VARCHAR(20),
    status_evasao_estudante BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
        SELECT ID, nome, idade, email, telefone, cpf, status_evasao
        FROM Estudante WHERE id_turma = turma_id;
END;
$$ LANGUAGE plpgsql;


-- Visualizar todos os cursos
SELECT * FROM listar_cursos();

-- Visualizar os módulos do curso de Desenvolvimento Web (ID = 1)
SELECT * FROM listar_modulos(1);

-- Visualizar todas as especializações
SELECT * FROM listar_especializacoes();

-- Visualizar todos os facilitadores
SELECT * FROM listar_facilitadores();

-- Visualizar todas as turmas
SELECT * FROM listar_turmas();

-- Visualizar os estudantes da turma de Desenvolvimento Web (ID = 1)
SELECT * FROM listar_estudantes(1);

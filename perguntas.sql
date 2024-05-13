SET search_path TO resilia;

-- quantidade de estudantes
select COUNT(*) from estudante

--Selecionar quais pessoas facilitadoras atuam em mais de uma turma
SELECT f.id, f.nome, COUNT(t.id) AS qtd
FROM Facilitador AS f
LEFT JOIN Turma AS t ON f.id = t.id_facilitador
GROUP BY f.id, f.nome
HAVING COUNT(t.id) > 1
ORDER BY qtd DESC;


-- view que selecione a porcentagem de estudantes com status de evasão agrupados por turma;

CREATE VIEW Porcentagem_Evasao_Por_Turma AS
SELECT 
    t.ID AS id_turma,
    COUNT(CASE WHEN e.status_evasao = TRUE THEN 1 END) AS qtd_evasao,
    COUNT(*) AS total_estudantes,
    ROUND((COUNT(CASE WHEN e.status_evasao = TRUE THEN 1 END) * 100.0 / COUNT(*)), 2) AS percentual_evasao
FROM 
    Turma AS t
LEFT JOIN 
    Estudante AS e ON t.ID = e.id_turma
GROUP BY 
    t.ID
ORDER BY 
    percentual_evasao DESC;


SELECT * FROM Porcentagem_Evasao_Por_Turma;


--Crie um trigger para ser disparado quando o atributo status de um estudante for atualizado e inserir um novo dado em uma tabela de log.

-- Criar a tabela de log
CREATE TABLE LogAtualizacaoStatus (
    ID SERIAL PRIMARY KEY,
    id_estudante INT,
    data_atualizacao TIMESTAMP DEFAULT date_trunc('second', CURRENT_TIMESTAMP),
    novo_status BOOLEAN
);

-- Criar o trigger
CREATE OR REPLACE FUNCTION atualizacao_status_trigger_function()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status_evasao != OLD.status_evasao THEN
        INSERT INTO LogAtualizacaoStatus (id_estudante, novo_status)
        VALUES (NEW.ID, NEW.status_evasao);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associar o trigger à tabela Estudante
CREATE TRIGGER atualizacao_status_trigger
AFTER UPDATE OF status_evasao ON Estudante
FOR EACH ROW
EXECUTE FUNCTION atualizacao_status_trigger_function();


-- Atualizar o status de evasão de alguns alunos para testar a trigger
UPDATE Estudante
SET status_evasao = true -- trocar para TRUE ou FALSE para editar o status dos alunos
WHERE ID IN (2, 7, 9);   -- selecionar os alunos para que irão mudar o status

SELECT * FROM LogAtualizacaoStatus; -- ver tabela log

-- PERGUNTA EXTRA:Quais são os cursos em que os estudantes estão matriculados e que têm uma duração superior N meses de meses?

SELECT 
    c.nome AS nome_curso,
    c.duracao_meses AS duracao_curso,
    COUNT(e.ID) AS total_estudantes
FROM 
    Curso AS c
JOIN 
    Turma AS t ON c.ID = t.id_curso
JOIN 
    Estudante AS e ON t.ID = e.id_turma
WHERE 
    c.duracao_meses > 5  -- NÚMERO DE MESES
GROUP BY 
    c.nome, c.duracao_meses
ORDER BY 
    c.duracao_meses DESC;

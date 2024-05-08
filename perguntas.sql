--Selecionar a quantidade total de estudantes cadastrados no banco:
SELECT COUNT(*) AS total_estudantes FROM Estudante;



-- Selecionar quais pessoas facilitadoras atuam em mais de uma turma:
SELECT F.nome, COUNT(*) AS qtd_turmas
FROM Facilitador F
JOIN Turma T ON F.ID = T.id_facilitador
GROUP BY F.ID
HAVING COUNT(*) > 1;




-- Criar uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma:
CREATE VIEW PorcentagemEvasao AS
SELECT T.nome AS turma, 
       COUNT(E.id) AS total_estudantes, 
       ROUND((SUM(CASE WHEN E.status_evasao THEN 1 ELSE 0 END) / COUNT(E.id)) * 100, 2) AS percentual_evasao
FROM Turma T
JOIN Estudante E ON T.ID = E.id_turma
GROUP BY T.ID;



-- Criar um trigger para ser disparado quando o atributo status de um estudante for atualizado e inserir um novo dado em uma tabela de log.
CREATE TABLE LogAtualizacaoStatus (
    ID SERIAL PRIMARY KEY,
    id_estudante INT,
    novo_status BOOLEAN,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION atualizacao_status()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogAtualizacaoStatus (id_estudante, novo_status)
    VALUES (NEW.ID, NEW.status_evasao);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER AtualizacaoStatus
AFTER UPDATE ON Estudante
FOR EACH ROW
EXECUTE FUNCTION atualizacao_status();




-- Quais são os cursos ministrados por facilitadores especializados em uma determinada área?

SELECT C.nome AS curso
FROM Curso C
JOIN Turma T ON C.ID = T.id_curso
JOIN Facilitador F ON T.id_facilitador = F.ID
WHERE F.especializacao = 'Especialização desejada';

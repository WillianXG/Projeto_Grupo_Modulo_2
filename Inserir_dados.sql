-- Dados para a tabela Curso
SET search_path TO resilia;
INSERT INTO Curso (nome, descricao, duracao_meses, qtd_modulo) 
VALUES 
    ('Desenvolvimento Web', 'Curso introdutório sobre desenvolvimento web.', 6, 5),
    ('Ciência de Dados', 'Curso abrangente sobre análise e interpretação de dados.', 9, 5),
    ('Marketing Digital', 'Curso avançado sobre estratégias de marketing online.', 7, 5),
    ('Gestão de Projetos', 'Curso prático sobre técnicas de gestão de projetos.', 8, 5),
    ('Design Gráfico', 'Curso criativo sobre princípios de design e ferramentas.', 5, 5);

-- Dados para a tabela Modulo
WITH Modulos AS (
    SELECT
        unnest(ARRAY['Introdução ao HTML', 'CSS Avançado', 'JavaScript Fundamentals', 'Backend Development', 'Web Design Principles']) AS nome,
        unnest(ARRAY['Conceitos básicos de HTML e estruturação de páginas web.', 'Estilização avançada com CSS.', 'Princípios fundamentais do JavaScript.', 'Desenvolvimento de aplicações back-end.', 'Princípios de design para web.']) AS descricao,
        unnest(ARRAY[1, 1, 1, 1, 1]) AS id_curso
    UNION ALL
    SELECT
        unnest(ARRAY['Estatística Básica', 'Análise de Dados Multivariados', 'Machine Learning', 'Big Data Analytics', 'Visualização de Dados']) AS nome,
        unnest(ARRAY['Conceitos estatísticos essenciais.', 'Análise de dados com múltiplas variáveis.', 'Introdução ao aprendizado de máquina.', 'Análise de grandes conjuntos de dados.', 'Técnicas de visualização de dados.']) AS descricao,
        unnest(ARRAY[2, 2, 2, 2, 2]) AS id_curso
    UNION ALL
    SELECT
        unnest(ARRAY['SEO Fundamentals', 'Google Ads', 'Social Media Marketing', 'Content Marketing', 'Email Marketing']) AS nome,
        unnest(ARRAY['Princípios básicos de otimização de mecanismos de busca.', 'Publicidade online com Google Ads.', 'Estratégias de marketing em redes sociais.', 'Marketing de conteúdo.', 'Estratégias de email marketing.']) AS descricao,
        unnest(ARRAY[3, 3, 3, 3, 3]) AS id_curso
    UNION ALL
    SELECT
        unnest(ARRAY['Scrum Methodology', 'Kanban Techniques', 'Project Planning', 'Risk Management', 'Agile Leadership']) AS nome,
        unnest(ARRAY['Metodologia ágil de gerenciamento de projetos.', 'Técnicas de gerenciamento visual de tarefas.', 'Planejamento de projetos.', 'Gestão de riscos em projetos.', 'Liderança em ambientes ágeis.']) AS descricao,
        unnest(ARRAY[4, 4, 4, 4, 4]) AS id_curso
    UNION ALL
    SELECT
        unnest(ARRAY['Fundamentos do Design', 'Tipografia', 'Cores e Composição', 'Branding', 'Design de Interfaces']) AS nome,
        unnest(ARRAY['Princípios básicos de design.', 'Estudo da tipografia e sua aplicação.', 'Teoria das cores e composição visual.', 'Gestão de marcas e identidade visual.', 'Design de interfaces digitais.']) AS descricao,
        unnest(ARRAY[5, 5, 5, 5, 5]) AS id_curso
)
INSERT INTO Modulo (nome, descricao, id_curso)
SELECT nome, descricao, id_curso FROM Modulos;

 -- inserindo especializacao
INSERT INTO Especializacao (nome_especializacao, descricao_especializacao) VALUES
('Desenvolvimento Web', 'Curso introdutório sobre desenvolvimento web.'),
('Ciência de Dados', 'Curso abrangente sobre análise e interpretação de dados.'),
('Marketing Digital', 'Curso avançado sobre estratégias de marketing online.'),
('Gestão de Projetos', 'Curso prático sobre técnicas de gestão de projetos.'),
('Design Gráfico', 'Curso criativo sobre princípios de design e ferramentas.'),
('Análise de Dados', 'Curso sobre análise de dados.'),
('SEO', 'Curso sobre otimização de mecanismos de busca.'),
('Gestão de Riscos', 'Curso sobre gestão de riscos.'),
('Gestão de Pessoas', 'Curso sobre gestão de pessoas.'),
('Inteligência Artificial', 'Curso sobre inteligência artificial.');


--- inserindo facilitador
INSERT INTO Facilitador (nome, ID_especializacao, email, telefone) VALUES
('João Silva', 1, 'joao.silva@example.com', '(11) 1234-5678'),
('Maria Souza', 2, 'maria.souza@example.com', '(11) 2345-6789'),
('Pedro Santos', 3, 'pedro.santos@example.com', '(11) 3456-7890'),
('Ana Oliveira', 4, 'ana.oliveira@example.com', '(11) 4567-8901'),
('Carlos Pereira', 5, 'carlos.pereira@example.com', '(11) 5678-9012'),
('Camila Costa', 1, 'camila.costa@example.com', '(11) 6789-0123'),
('Fernando Lima', 2, 'fernando.lima@example.com', '(11) 7890-1234'),
('Luiza Mendes', 3, 'luiza.mendes@example.com', '(11) 8901-2345'),
('Rafaela Almeida', 4, 'rafaela.almeida@example.com', '(11) 9012-3456'),
('Gustavo Oliveira', 5, 'gustavo.oliveira@example.com', '(11) 0123-4567');

-- inserindo dados da turma
INSERT INTO Turma (nome, descricao, id_curso, id_facilitador) VALUES
('Turma de Desenvolvimento Web', 'Esta turma é voltada para iniciantes que desejam aprender desenvolvimento web.', 1, 1),
('Turma de Ciência de Dados Avançada', 'Esta turma é para profissionais que desejam aprofundar seus conhecimentos em ciência de dados.', 2, 2),
('Turma de Marketing Digital', 'Esta turma é para empresários e profissionais de marketing que desejam aprender estratégias digitais.', 3, 3),
('Turma de Gestão de Projetos Prática', 'Esta turma é voltada para gestores e líderes de projetos que desejam melhorar suas habilidades práticas.', 4, 4),
('Turma de Design Gráfico Criativo', 'Esta turma é para designers iniciantes que desejam aprender princípios de design e ferramentas.', 5, 5),
('Turma de Desenvolvimento Web Avançado', 'Esta turma é para desenvolvedores experientes que desejam aprimorar suas habilidades.', 1, 6),
('Turma de Análise de Dados Multivariados', 'Esta turma é para analistas de dados que desejam aprender técnicas avançadas de análise multivariada.', 2, 7),
('Turma de SEO Avançado', 'Esta turma é para profissionais de marketing digital que desejam aprofundar seus conhecimentos em SEO.', 3, 8),
('Turma de Gestão de Riscos em Projetos', 'Esta turma é para gestores de projetos que desejam aprender técnicas avançadas de gerenciamento de riscos.', 4, 9),
('Turma de Inteligência Artificial Aplicada', 'Esta turma é para desenvolvedores e cientistas de dados que desejam aprender sobre inteligência artificial aplicada.', 2, 7),
('Turma de Desenvolvimento Web Intermediário', 'Esta turma é para pessoas com conhecimentos básicos de desenvolvimento web que desejam avançar seus estudos.', 1, 1),
('Turma de Análise de Dados para Negócios', 'Esta turma é para profissionais de negócios que desejam aprender a usar dados para tomar decisões.', 2, 2),
('Turma de Estratégias Avançadas de Marketing Digital', 'Esta turma é para profissionais de marketing que desejam aprofundar suas habilidades em marketing digital.', 3, 3),
('Turma de Gerenciamento de Projetos Ágil', 'Esta turma é para gestores de projetos que desejam aprender sobre metodologias ágeis de gerenciamento.', 4, 4),
('Turma de Design Gráfico para Mídias Sociais', 'Esta turma é para designers que desejam criar conteúdo visual para mídias sociais.', 5, 5);

-- inserindo estudantes
INSERT INTO Estudante (nome, idade, email, telefone, cpf, status_evasao, id_turma) VALUES
('João Silva', 25, 'joao.silva@example.com', '(11) 1234-5678', '123.456.789-00', false, 1),
('Maria Souza', 30, 'maria.souza@example.com', '(11) 2345-6789', '987.555.321-00', false, 2),
('Pedro Santos', 28, 'pedro.santos@example.com', '(11) 3456-7890', '456.789.652-00', true, 3),
('Ana Oliveira', 22, 'ana.oliveira@example.com', '(11) 4567-8901', '789.123.456-00', false, 4),
('Carlos Pereira', 35, 'carlos.pereira@example.com', '(11) 5678-9012', '159.357.258-00', true, 5),
('Camila Costa', 27, 'camila.costa@example.com', '(11) 6789-0123', '753.951.486-00', false, 1),
('Fernando Lima', 29, 'fernando.lima@example.com', '(11) 7890-1234', '369.258.147-00', false, 2),
('Luiza Mendes', 31, 'luiza.mendes@example.com', '(11) 8901-2345', '852.741.963-00', true, 3),
('Rafaela Almeida', 26, 'rafaela.almeida@example.com', '(11) 9012-3456', '456.789.123-00', false, 4),
('Gustavo Oliveira', 33, 'gustavo.oliveira@example.com', '(11) 0123-4567', '621.654.321-00', false, 5),
('Ana Silva', 24, 'ana.silva@example.com', '(11) 2345-6789', '123.456.789-01', true, 1),
('Paulo Souza', 32, 'paulo.souza@example.com', '(11) 3456-7890', '865.654.321-01', false, 2),
('Gabriela Santos', 29, 'gabriela.santos@example.com', '(11) 4567-8901', '456.789.123-01', true, 3),
('Ricardo Oliveira', 27, 'ricardo.oliveira@example.com', '(11) 5678-9012', '159.357.258-01', false, 4),
('Mariana Costa', 30, 'mariana.costa@example.com', '(11) 6789-0123', '753.951.486-01', false, 5),
('Carlos Lima', 34, 'carlos.lima@example.com', '(11) 7890-1234', '369.258.147-01', true, 1),
('Isabela Mendes', 25, 'isabela.mendes@example.com', '(11) 8901-2345', '852.741.963-01', false, 2),
('Julio Almeida', 28, 'julio.almeida@example.com', '(11) 9012-3456', '456.789.123-02', false, 3),
('Sandra Oliveira', 31, 'sandra.oliveira@example.com', '(11) 0123-4567', '953.654.321-02', true, 4),
('Lucas Silva', 33, 'lucas.silva@example.com', '(11) 2345-6789', '123.456.789-02', false, 5),
('Cristina Souza', 29, 'cristina.souza@example.com', '(11) 3456-7890', '987.654.321-03', false, 1),
('André Santos', 26, 'andre.santos@example.com', '(11) 4567-8901', '456.789.123-03', true, 2),
('Bruna Oliveira', 30, 'bruna.oliveira@example.com', '(11) 5678-9012', '159.357.258-03', false, 3),
('Diego Costa', 32, 'diego.costa@example.com', '(11) 6789-0123', '753.951.486-03', true, 4),
('Larissa Lima', 27, 'larissa.lima@example.com', '(11) 7890-1234', '369.258.147-03', false, 5),
('Roberto Mendes', 31, 'roberto.mendes@example.com', '(11) 8901-2345', '852.741.963-03', false, 1),
('Patricia Almeida', 29, 'patricia.almeida@example.com', '(11) 9012-3456', '456.789.123-04', true, 2),
('Marcelo Oliveira', 34, 'marcelo.oliveira@example.com', '(11) 0123-4567', '406.654.321-04', false, 3),
('Daniela Silva', 30, 'daniela.silva@example.com', '(11) 2345-6789', '123.456.789-04', false, 4),
('Vitor Souza', 28, 'vitor.souza@example.com', '(11) 3456-7890', '987.328.321-05', true, 5),
('Carla Santos', 32, 'carla.santos@example.com', '(11) 4567-8901', '456.789.123-05', false, 1),
('Felipe Oliveira', 29, 'felipe.oliveira@example.com', '(11) 5678-9012', '159.357.258-05', false, 2),
('Vanessa Costa', 30, 'vanessa.costa@example.com', '(11) 6789-0123', '753.951.486-05', true, 3),
('Renato Lima', 27, 'renato.lima@example.com', '(11) 7890-1234', '369.258.147-05', false, 4),
('Aline Mendes', 31, 'aline.mendes@example.com', '(11) 8901-2345', '852.741.963-05', false, 5),
('Rodrigo Almeida', 28, 'rodrigo.almeida@example.com', '(11) 9012-3456', '456.789.123-06', true, 1),
('Tatiane Oliveira', 29, 'tatiane.oliveira@example.com', '(11) 0123-4567', '954.195.321-06', false, 2),
('Luciana Silva', 33, 'luciana.silva@example.com', '(11) 2345-6789', '123.456.789-06', false, 3),
('Gustavo Souza', 30, 'gustavo.souza@example.com', '(11) 3456-7890', '987.654.652-07', false, 4),
('Juliana Santos', 29, 'juliana.santos@example.com', '(11) 4567-8901', '456.789.123-07', true, 5),
('Renata Oliveira', 31, 'renata.oliveira@example.com', '(11) 5678-9012', '159.357.258-07', false, 1),
('Anderson Costa', 28, 'anderson.costa@example.com', '(11) 6789-0123', '753.951.486-07', false, 2),
('Fabiana Lima', 30, 'fabiana.lima@example.com', '(11) 7890-1234', '369.258.147-07', true, 3),
('Alexandre Mendes', 27, 'alexandre.mendes@example.com', '(11) 8901-2345', '852.741.963-07', false, 4),
('Simone Almeida', 31, 'simone.almeida@example.com', '(11) 9012-3456', '456.789.123-08', false, 5),
('Raphael Oliveira', 29, 'raphael.oliveira@example.com', '(11) 0123-4567', '987.985.321-08', true, 1),
('Bianca Silva', 33, 'bianca.silva@example.com', '(11) 2345-6789', '123.456.789-08', false, 2),
('Paula Souza', 30, 'paula.souza@example.com', '(11) 3456-7890', '987.654.321-09', false, 3),
('Marcos Santos', 28, 'marcos.santos@example.com', '(11) 4567-8901', '456.789.123-09', true, 4),
('Larissa Oliveira', 32, 'larissa.oliveira@example.com', '(11) 5678-9012', '159.357.258-09', false, 5),
('Rodrigo Costa', 29, 'rodrigo.costa@example.com', '(11) 6789-0123', '753.951.486-09', false, 1),
('Renata Lima', 31, 'renata.lima@example.com', '(11) 7890-1234', '369.258.147-09', true, 2),
('Marcela Mendes', 27, 'marcela.mendes@example.com', '(11) 8901-2345', '852.741.963-09', false, 3),
('Guilherme Almeida', 32, 'guilherme.almeida@example.com', '(11) 9012-3456', '456.789.123-10', false, 4),
('Sabrina Oliveira', 29, 'sabrina.oliveira@example.com', '(11) 0123-4567', '987.324.321-10', false, 5),
   ('Laura Rodrigues', 20, 'laura.rodrigues@example.com', '(777) 888-9999', '777.888.999-11', FALSE, 1),
    ('Guilherme Alves', 21, 'guilherme.alves@example.com', '(111) 222-3333', '111.222.333-11', TRUE, 2),
    ('Isabela Oliveira', 22, 'isabela.oliveira@example.com', '(333) 444-5555', '333.444.555-11', FALSE, 3),
    ('Renan Martins', 20, 'renan.martins@example.com', '(444) 555-6666', '444.555.666-11', TRUE, 4),
    ('Natália Pereira', 21, 'natalia.pereira@example.com', '(666) 777-8888', '666.777.888-11', FALSE, 5),
    ('Vinícius Silva', 19, 'vinicius.silva@example.com', '(777) 888-9999', '777.888.999-22', FALSE, 6),
    ('Larissa Costa', 21, 'larissa.costa@example.com', '(111) 222-3333', '111.222.333-22', TRUE, 7),
    ('Thales Gonçalves', 22, 'thales.goncalves@example.com', '(333) 444-5555', '333.444.555-22', FALSE, 8),
    ('Carolina Lima', 20, 'carolina.lima@example.com', '(444) 555-6666', '444.555.666-22', TRUE, 9),
    ('Matheus Santos', 21, 'matheus.santos@example.com', '(666) 777-8888', '666.777.888-22', FALSE, 10),
    ('Fernando Oliveira', 19, 'fernando.oliveira@example.com', '(777) 888-9999', '777.888.999-33', FALSE, 11),
    ('Patrícia Martins', 21, 'patricia.martins@example.com', '(111) 222-3333', '111.222.333-33', TRUE, 12),
    ('Roberto Silva', 22, 'roberto.silva@example.com', '(333) 444-5555', '333.444.555-33', FALSE, 13),
    ('Bianca Costa', 20, 'bianca.costa@example.com', '(444) 555-6666', '444.555.666-33', TRUE, 14),
    ('Gabriela Santos', 21, 'gabriela.santos@example.com', '(666) 777-8888', '666.777.888-33', FALSE, 15),
    ('Felipe Oliveira', 19, 'felipe.oliveira@example.com', '(777) 888-9999', '777.888.999-44', FALSE, 1),
    ('Jéssica Martins', 21, 'jessica.martins@example.com', '(111) 222-3333', '111.222.333-44', TRUE, 2),
    ('Renato Silva', 22, 'renato.silva@example.com', '(333) 444-5555', '333.444.555-44', FALSE, 3),
    ('Marina Costa', 20, 'marina.costa@example.com', '(444) 555-6666', '444.555.666-44', TRUE, 4),
    ('Ricardo Santos', 21, 'ricardo.santos@example.com', '(666) 777-8888', '666.777.888-44', FALSE, 5),
    ('Gabriel Oliveira', 19, 'gabriel.oliveira@example.com', '(777) 888-9999', '777.888.999-55', FALSE, 6),
    ('Letícia Martins', 21, 'leticia.martins@example.com', '(111) 222-3333', '111.222.333-55', TRUE, 7),
    ('Roberta Silva', 22, 'roberta.silva@example.com', '(333) 444-5555', '333.444.555-55', FALSE, 8),
    ('Leonardo Costa', 20, 'leonardo.costa@example.com', '(444) 555-6666', '444.555.666-55', TRUE, 9),
    ('Camila Santos', 21, 'camila.santos@example.com', '(666) 777-8888', '666.777.888-55', FALSE, 10),
    ('Rafael Oliveira', 19, 'rafael.oliveira@example.com', '(777) 888-9999', '777.888.999-66', FALSE, 11),
    ('Carla Martins', 21, 'carla.martins@example.com', '(111) 222-3333', '111.222.333-66', TRUE, 12),
    ('Diego Silva', 22, 'diego.silva@example.com', '(333) 444-5555', '333.444.555-66', FALSE, 13),
    ('Vanessa Costa', 20, 'vanessa.costa@example.com', '(444) 555-6666', '444.555.666-66', TRUE, 14),
    ('Rodrigo Santos', 21, 'rodrigo.santos@example.com', '(666) 777-8888', '666.777.888-66', FALSE, 15),
    ('Patrícia Oliveira', 19, 'patricia.oliveira@example.com', '(777) 888-9999', '777.888.999-77', FALSE, 1),
    ('Lucas Martins', 21, 'lucas.martins@example.com', '(111) 222-3333', '111.222.333-77', TRUE, 2),
    ('Ana Silva', 22, 'ana.silva@example.com', '(333) 444-5555', '333.444.555-77', FALSE, 3),
    ('Paulo Costa', 20, 'paulo.costa@example.com', '(444) 555-6666', '444.555.666-77', TRUE, 4),
    ('Tatiane Santos', 21, 'tatiane.santos@example.com', '(666) 777-8888', '666.777.888-77', FALSE, 5),
    ('Daniel Oliveira', 19, 'daniel.oliveira@example.com', '(777) 888-9999', '777.888.999-88', FALSE, 6),
    ('Nathalia Martins', 21, 'nathalia.martins@example.com', '(111) 222-3333', '111.222.333-88', TRUE, 7),
    ('Vinícius Silva', 22, 'vinicius.silva@example.com', '(333) 444-5555', '333.444.555-88', FALSE, 8),
    ('Larissa Costa', 20, 'larissa.costa@example.com', '(444) 555-6666', '444.555.666-88', TRUE, 9),
    ('Rafaela Santos', 21, 'rafaela.santos@example.com', '(666) 777-8888', '666.777.888-88', FALSE, 10),
    ('Lucas Oliveira', 19, 'lucas.oliveira@example.com', '(777) 888-9999', '777.888.999-99', FALSE, 11),
    ('Carolina Martins', 21, 'carolina.martins@example.com', '(111) 222-3333', '111.222.333-99', TRUE, 12),
    ('Gabriel Silva', 22, 'gabriel.silva@example.com', '(333) 444-5555', '333.444.555-99', FALSE, 13),
    ('Juliana Costa', 20, 'juliana.costa@example.com', '(444) 555-6666', '444.555.666-99', TRUE, 14),
    ('Matheus Santos', 21, 'matheus.santos@example.com', '(666) 777-8888', '666.777.888-99', FALSE, 15),
    ('Luana Oliveira', 20, 'luana.oliveira@example.com', '(777) 888-9999', '777.888.999-01', FALSE, 5),
    ('Felipe Martins', 21, 'felipe.martins@example.com', '(111) 222-3333', '111.222.333-01', TRUE, 6),
    ('Aline Silva', 22, 'aline.silva@example.com', '(333) 444-5555', '333.444.555-01', FALSE, 7),
    ('Rodrigo Costa', 20, 'rodrigo.costa@example.com', '(444) 555-6666', '444.555.666-01', TRUE, 8),
    ('Marina Santos', 21, 'marina.santos@example.com', '(666) 777-8888', '666.777.888-01', FALSE, 9),
    ('Renato Oliveira', 19, 'renato.oliveira@example.com', '(777) 888-9999', '777.888.999-02', FALSE, 10),
    ('Patrícia Martins', 21, 'patricia.martins@example.com', '(111) 222-3333', '111.222.333-02', TRUE, 11),
    ('Gustavo Silva', 22, 'gustavo.silva@example.com', '(333) 444-5555', '333.444.555-02', FALSE, 12),
    ('Amanda Costa', 20, 'amanda.costa@example.com', '(444) 555-6666', '444.555.666-02', TRUE, 13),
    ('Leonardo Santos', 21, 'leonardo.santos@example.com', '(666) 777-8888', '666.777.888-02', FALSE, 14),
    ('Juliana Oliveira', 19, 'juliana.oliveira@example.com', '(777) 888-9999', '777.888.999-03', FALSE, 15),
    ('Roberto Martins', 21, 'roberto.martins@example.com', '(111) 222-3333', '111.222.333-03', TRUE, 5),
    ('Fernanda Silva', 22, 'fernanda.silva@example.com', '(333) 444-5555', '333.444.555-03', FALSE, 6),
    ('Lucas Costa', 20, 'lucas.costa@example.com', '(444) 555-6666', '444.555.666-03', TRUE, 7),
    ('Mariana Santos', 21, 'mariana.santos@example.com', '(666) 777-8888', '666.777.888-03', FALSE, 8),
    ('Rafael Oliveira', 19, 'rafael.oliveira@example.com', '(777) 888-9999', '777.888.999-04', FALSE, 9),
    ('Camila Martins', 21, 'camila.martins@example.com', '(111) 222-3333', '111.222.333-04', TRUE, 10),
    ('Pedro Silva', 22, 'pedro.silva@example.com', '(333) 444-5555', '333.444.555-04', FALSE, 11),
    ('Isabela Costa', 20, 'isabela.costa@example.com', '(444) 555-6666', '444.555.666-04', TRUE, 12),
    ('Bruno Santos', 21, 'bruno.santos@example.com', '(666) 777-8888', '666.777.888-04', FALSE, 13),
    ('Larissa Oliveira', 19, 'larissa.oliveira@example.com', '(777) 888-9999', '777.888.999-05', FALSE, 14),
    ('Ricardo Martins', 21, 'ricardo.martins@example.com', '(111) 222-3333', '111.222.333-05', TRUE, 15),
    ('Natália Silva', 22, 'natalia.silva@example.com', '(333) 444-5555', '333.444.555-05', FALSE, 5),
    ('Diego Costa', 20, 'diego.costa@example.com', '(444) 555-6666', '444.555.666-05', TRUE, 6),
    ('Fernanda Santos', 21, 'fernanda.santos@example.com', '(666) 777-8888', '666.777.888-05', FALSE, 7),
    ('Thiago Oliveira', 19, 'thiago.oliveira@example.com', '(777) 888-9999', '777.888.999-06', FALSE, 8),
    ('Ana Martins', 21, 'ana.martins@example.com', '(111) 222-3333', '111.222.333-06', TRUE, 9),
    ('Gabriela Silva', 22, 'gabriela.silva@example.com', '(333) 444-5555', '333.444.555-06', FALSE, 10),
    ('Vinícius Costa', 20, 'vinicius.costa@example.com', '(444) 555-6666', '444.555.666-06', TRUE, 11),
    ('Carolina Santos', 21, 'carolina.santos@example.com', '(666) 777-8888', '666.777.888-06', FALSE, 12),
    ('Vanessa Oliveira', 19, 'vanessa.oliveira@example.com', '(777) 888-9999', '777.888.999-07', FALSE, 13),
    ('Marcos Martins', 21, 'marcos.martins@example.com', '(111) 222-3333', '111.222.333-07', TRUE, 14),
    ('Jéssica Silva', 22, 'jessica.silva@example.com', '(333) 444-5555', '333.444.555-07', FALSE, 15),
    ('Felipe Costa', 20, 'felipe.costa@example.com', '(444) 555-6666', '444.555.666-07', TRUE, 5),
    ('Amanda Santos', 21, 'amanda.santos@example.com', '(666) 777-8888', '666.777.888-07', FALSE, 6),
    ('Bruno Oliveira', 19, 'bruno.oliveira@example.com', '(777) 888-9999', '777.888.999-08', FALSE, 7),
    ('Carla Martins', 21, 'carla.martins@example.com', '(111) 222-3333', '111.222.333-08', TRUE, 8),
    ('Tatiane Silva', 22, 'tatiane.silva@example.com', '(333) 444-5555', '333.444.555-08', FALSE, 9),
    ('Gabriel Costa', 20, 'gabriel.costa@example.com', '(444) 555-6666', '444.555.666-08', TRUE, 10),
    ('Luiza Santos', 21, 'luiza.santos@example.com', '(666) 777-8888', '666.777.888-08', FALSE, 11),
    ('Paulo Oliveira', 19, 'paulo.oliveira@example.com', '(777) 888-9999', '777.888.999-09', FALSE, 12),
    ('Júlia Martins', 21, 'julia.martins@example.com', '(111) 222-3333', '111.222.333-09', TRUE, 13),
    ('Rodrigo Silva', 22, 'rodrigo.silva@example.com', '(333) 444-5555', '333.444.555-09', FALSE, 14),
    ('Mariana Costa', 20, 'mariana.costa@example.com', '(444) 555-6666', '444.555.666-09', TRUE, 15),
    ('Thiago Santos', 21, 'thiago.santos@example.com', '(666) 777-8888', '666.777.888-09', FALSE, 5),
    ('Aline Oliveira', 19, 'aline.oliveira@example.com', '(777) 888-9999', '777.888.999-10', FALSE, 6),
    ('Renan Martins', 21, 'renan.martins@example.com', '(111) 222-3333', '111.222.333-10', TRUE, 7),
    ('Letícia Silva', 22, 'leticia.silva@example.com', '(333) 444-5555', '333.444.555-10', FALSE, 8),
    ('Bruna Costa', 20, 'bruna.costa@example.com', '(444) 555-6666', '444.555.666-10', TRUE, 9),
    ('Pedro Santos', 21, 'pedro.santos@example.com', '(666) 777-8888', '666.777.888-10', FALSE, 10);



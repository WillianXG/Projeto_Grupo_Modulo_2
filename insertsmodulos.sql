-- Dados para a tabela Curso
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

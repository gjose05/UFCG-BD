-- Questão 1: 
-- Criação da tabela TAREFAS, para realizar as inserções.
CREATE TABLE tarefas(
    id_tarefa INTEGER,
    tarefa_funcionario TEXT,
    cpf_funcionario VARCHAR(11),
    numero_tarefas INTEGER,
    texto VARCHAR(1)
);

INSERT INTO tarefas VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');

INSERT INTO tarefas VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');

INSERT INTO tarefas VALUES (null, null, null, null, null);

-- deu erro
INSERT INTO tarefas VALUES (2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');
-- deu erro
INSERT INTO tarefas VALUES (2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');

-- Questão 2:

-- deu erro
INSERT INTO tarefas VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');
-- alterei o tipo
ALTER TABLE tarefas ALTER COLUMN id_tarefa SET DATA TYPE BIGINT;
-- deu certo
INSERT INTO tarefas VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');

-- Questão 3:

-- deletar onde os valores sao maiores que o necessario
DELETE FROM tarefas WHERE numero_tarefas > 32767;
-- alterar o tipo da coluna
ALTER TABLE tarefas ALTER COLUMN numero_tarefas SET DATA TYPE SMALLINT;
-- deu erro
INSERT INTO tarefas VALUES (2147483649, 'limpar portas da entrada principal','32322525199', 32768, 'A');
-- deu erro
INSERT INTO tarefas VALUES (2147483650, 'limpar janelas da entrada principal', '32333233288', 32769, 'A');
-- deu certo
INSERT INTO tarefas VALUES (2147483651, 'limpar portas do 1o andar','32323232911', 32767, 'A');
-- deu certo
INSERT INTO tarefas VALUES (2147483652, 'limpar portas do 2o andar', '32323232911', 32766, 'A');

-- Questão 4:

-- tinha um id null
DELETE FROM tarefas WHERE id_tarefa is null;
-- colocando para not null todas as colunas da tabela
ALTER TABLE tarefas ALTER COLUMN id_tarefa SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN tarefa_funcionario SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN cpf_funcionario SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN numero_tarefas SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN texto SET NOT NULL;

-- Questão 5:

-- adicionei
INSERT INTO tarefas VALUES (2147483653, 'limpar portas do 1o andar','32323232911', 2, 'A');
-- adicionei a unicidade
ALTER TABLE tarefas ADD CONSTRAINT id_unico UNIQUE (id_tarefa);
-- deu erro
INSERT INTO tarefas VALUES (2147483653, 'aparar a grama da área frontal', '32323232911', 3, 'A');

-- Questão 6:
-- a)
-- alterei
ALTER TABLE tarefas ADD CONSTRAINT checa_caractere CHECK (LENGTH(cpf_funcionario) = 11);

-- b)
-- atualizando os valores
UPDATE tarefas SET texto = 'P' WHERE texto = 'A';
UPDATE tarefas SET texto = 'E' WHERE texto = 'R';
UPDATE tarefas SET texto = 'C' WHERE texto = 'F';
-- definindo os novos valores 
ALTER TABLE tarefas ADD CONSTRAINT novo_status CHECK (texto IN ('P', 'E', 'C'));

-- Questão 7;

-- tirar as que possuem numero maior que 5
UPDATE tarefas SET numero_tarefas = 5 WHERE numero_tarefas > 5;
-- adicionar apenas os niveis de prioridade necessario
ALTER TABLE tarefas ADD CONSTRAINT nova_prioridade CHECK (numero_tarefas IN (0,1,2,3,4,5));

-- Questão 8:
CREATE TABLE funcionario(
    cpf VARCHAR(11) CONSTRAINT funcionario_cpf_pkey PRIMARY KEY,
    data_nasc DATE,
    nome TEXT,
    funcao TEXT,
    nivel VARCHAR(1),
    superior_cpf VARCHAR(11) CONSTRAINT funcionario_superior_cpf_fkey FOREIGN KEY,
    CONSTRAINT 
)




-- tipo dos estados do nordeste
CREATE TYPE estados_nordeste AS ENUM ('AL','BA','CE','MA','PB','PE','PI','RN','SE');

-- tabela farmacias 
CREATE TABLE farmacias(
    id_farmacia SERIAL, 
    sede_filial VARCHAR(6) NOT NULL, 
    estado_atuação estados_nordeste NOT NULL, 
    cidade_atuaçao VARCHAR(50), 
    bairro_atuaçao VARCHAR(50),
    gerente_farmacia VARCHAR(11),
    tipo_gerente VARCHAR(1)
);

-- adiciona a unicidade do bairro
ALTER TABLE farmacias
ADD CONSTRAINT bairro_unico
EXCLUDE USING gist(
    bairro_atuaçao WITH =,
    cidade_atuaçao WITH =,
    estado_atuação WITH =
);

-- adiciona unicidade da sede
ALTER TABLE farmacias
ADD CONSTRAINT sede_unica
EXCLUDE USING gist(
sede_filial WITH =) WHERE (sede_filial = 'sede');

-- primary key
ALTER TABLE farmacias
ADD CONSTRAINT farmacias_id_farmacias_pkey PRIMARY KEY (id_farmacia);




-- tabela dos funcionarios
CREATE TABLE funcionarios_farmacia(
    cpf_funcionario VARCHAR(11), 
    nome_funcionario VARCHAR (50),    
    farmacia_atuaçao INTEGER, 
    tipo_funcionario VARCHAR(1)
);

-- primary key
ALTER TABLE funcionarios_farmacia
ADD CONSTRAINT funcionario_farmacia_cpf_funcionario_pkey PRIMARY KEY (cpf_funcionario);

-- foreing key
ALTER TABLE funcionarios_farmacia
ADD CONSTRAINT funcionarios_farmacia_farmacias_fkey FOREIGN KEY (farmacia_atuaçao) REFERENCES farmacias (id_farmacia);

-- foreign key do gerente
ALTER TABLE farmacias
ADD CONSTRAINT farmacias_gerente_farmacia_fkey FOREIGN KEY (gerente_farmacia,tipo_gerente) REFERENCES funcionarios_farmacia(cpf_funcionario,tipo_funcionario);

--tipo funcionario
ALTER TABLE funcionarios_farmacia
ADD CONSTRAINT funcionarios_farmacia_tipo_funcionario 
CHECK (tipo_funcionario IN ('f', 'v', 'e', 'c', 'a'));




-- tabela medicamentos
CREATE TABLE medicamentos_farmacia(
    id_medicamento SERIAL, 
    nome_remedio VARCHAR(50),
    preço_remedio INTEGER,
    venda_exclusiva_receita BOOLEAN
);

--primary key
ALTER TABLE medicamentos_farmacia
ADD CONSTRAINT medicamentos_farmacia_id_medicamento_pkey PRIMARY KEY (id_medicamento);




-- tabela de vendas
CREATE TABLE vendas_farmacias(
    id_venda SERIAL, --primary key
    data_venda DATE,
    funcionario_responsavel, --foreign key
    medicamento_vendido, --foreign key


)
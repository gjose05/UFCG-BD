-- Questão 1:
CREATE TABLE automoveis_seguradora(
placa VARCHAR(15), --(primary key)
modelo VARCHAR (15),
marca VARCHAR (15),
ano_do_modelo VARCHAR(4),
cor_do_modelo VARCHAR (15));

CREATE TABLE cliente_seguradora(
cpf VARCHAR(14), --(primary key)
nome_completo VARCHAR(50),
data_de_nascimento DATE,
tipo_do_seguro TEXT);

CREATE TABLE perito_seguradora(
    cpf VARCHAR(14),
    nome_completo VARCHAR(50),
    data_de_nascimento DATE,
    servicos_ofertados TEXT);

CREATE TABLE oficina_seguradora(
    cep VARCHAR(20),
    nome_da_oficina VARCHAR(20),
    servicos_ofertados TEXT);

CREATE TABLE seguro_seguradora(
    cliente_segurado VARCHAR(14), --(primary key e foreign key)
    automovel_segurado VARCHAR(15), --(primary key e foreign key)
    sinistro_segurado INTEGER, --(foreign key)
    inicio_do_contrato TIMESTAMP,
    fim_do_contrato TIMESTAMP,
    valor_do_contrato INTEGER,
    cobertura_seguro TEXT);

CREATE TABLE sinistro_seguradora(
    numero_do_sinistro SERIAL, --(primary key)
    tipo_do_sinistro TEXT,
    classificacao_sinistro VARCHAR(2),
    servicos_cobertos TEXT);


CREATE TABLE pericia_seguradora(
    perito_responsavel VARCHAR(14), --(primary key e foreign key)
    cliente_segurado VARCHAR(14), --(primary key e foreign key)
    descricao_ocorrencia TEXT,
    data_pericia DATE);


CREATE TABLE reparo_seguradora(
    oficina_responsavel VARCHAR(20), --(primary key e foreign key)
    cliente_segurado VARCHAR(14), --(primary key e foreign key)
    sinistro_realizado INTEGER, --(foreign key)
    descricao_servicos TEXT,
    data_servico DATE);

--QUESTAO 2:
feito

-- QUESTAO 3:
ALTER TABLE automoveis_seguradora ADD PRIMARY KEY (placa);
ALTER TABLE cliente_seguradora ADD PRIMARY KEY (cpf);
ALTER TABLE perito_seguradora ADD PRIMARY KEY (cpf);
ALTER TABLE oficina_seguradora ADD PRIMARY KEY (cep);
ALTER TABLE seguro_seguradora ADD PRIMARY KEY (cliente_segurado, automovel_segurado);
ALTER TABLE sinistro_seguradora ADD PRIMARY KEY (numero_do_sinistro);
ALTER TABLE pericia_seguradora ADD PRIMARY KEY (perito_responsavel, cliente_segurado);
ALTER TABLE reparo_seguradora ADD PRIMARY KEY (oficina_responsavel, cliente_segurado);

-- QUESTAO 4:

ALTER TABLE cliente_seguradora
ADD CONSTRAINT automovel_do_cliente
FOREIGN KEY (carro_segurado)
REFERENCES automoveis_seguradora (placa);

ALTER TABLE seguro_seguradora
ADD CONSTRAINT cliente_seguro
FOREIGN KEY (cliente_segurado)
REFERENCES cliente_seguradora (cpf);

ALTER TABLE seguro_seguradora
ADD CONSTRAINT automovel_seguro
FOREIGN KEY (automovel_segurado)
REFERENCES automoveis_seguradora (placa);

ALTER TABLE seguro_seguradora
ADD CONSTRAINT sinistro_seguro
FOREIGN KEY (sinistro_segurado)
REFERENCES sinistro_seguradora (numero_do_sinistro);

ALTER TABLE pericia_seguradora
ADD CONSTRAINT pericia_realizada
FOREIGN KEY (perito_responsavel)
REFERENCES perito_seguradora (cpf);

ALTER TABLE pericia_seguradora
ADD CONSTRAINT pericia_cliente
FOREIGN KEY (cliente_segurado)
REFERENCES cliente_seguradora (cpf);

ALTER TABLE reparo_seguradora
ADD CONSTRAINT oficina_reparo
FOREIGN KEY (oficina_responsavel)
REFERENCES oficina_seguradora (cep);

ALTER TABLE reparo_seguradora
ADD CONSTRAINT cliente_reparo
FOREIGN KEY (cliente_segurado)
REFERENCES cliente_seguradora (cpf);

ALTER TABLE reparo_seguradora
ADD CONSTRAINT sinistro_reparo
FOREIGN KEY (sinistro_realizado)
REFERENCES sinistro_seguradora (numero_do_sinistro);

--QUESTAO 5:
feito

--QUESTAO 6:
DROP TABLE automoveis_seguradora CASCADE;
DROP TABLE cliente_seguradora CASCADE;
DROP TABLE perito_seguradora CASCADE;
DROP TABLE oficina_seguradora CASCADE;
DROP TABLE seguro_seguradora CASCADE;
DROP TABLE sinistro_seguradora CASCADE;
DROP TABLE pericia_seguradora CASCADE;
DROP TABLE reparo_seguradora CASCADE;

--QUESTAO 7:
CREATE TABLE automoveis_seguradora(
placa VARCHAR(15), 
modelo VARCHAR (15),
marca VARCHAR (15),
ano_do_modelo VARCHAR(4),
cor_do_modelo VARCHAR (15),
CONSTRAINT automoveis_seguradora_pkey PRIMARY KEY (placa));

CREATE TABLE cliente_seguradora(
cpf VARCHAR(14), 
nome_completo VARCHAR(50),
data_de_nascimento DATE,
tipo_do_seguro TEXT,
CONSTRAINT cliente_seguradora_pkey PRIMARY KEY (cpf));

CREATE TABLE perito_seguradora(
cpf VARCHAR(14),
nome_completo VARCHAR(50),
data_de_nascimento DATE,
servicos_ofertados TEXT,
CONSTRAINT pericia_seguradora_pkey PRIMARY KEY (cpf));

CREATE TABLE oficina_seguradora(
cep VARCHAR(20),
nome_da_oficina VARCHAR(20),
servicos_ofertados TEXT,
CONSTRAINT oficina_seguradora_pkey PRIMARY KEY (cep));

CREATE TABLE seguro_seguradora(
cliente_segurado VARCHAR(14), --(primary key e foreign key)
automovel_segurado VARCHAR(15), --(primary key e foreign key)
sinistro_segurado INTEGER, --(foreign key)
inicio_do_contrato TIMESTAMP,
fim_do_contrato TIMESTAMP,
valor_do_contrato INTEGER,
cobertura_seguro TEXT,
CONSTRAINT seguro_seguradora_pkey PRIMARY KEY (cliente_segurado, automovel_segurado),
CONSTRAINT seguro_seguradora_cliente_segurado_fkey FOREIGN KEY (cliente_segurado) REFERENCES cliente_seguradora (cpf),
CONSTRAINT seguro_seguradora_automovel_segurado_fkey FOREIGN KEY (automovel_segurado) REFERENCES automoveis_seguradora (placa),
CONSTRAINT seguro_seguradora_sinistro_segurado_fkey FOREIGN KEY (sinistro_segurado) REFERENCES sinistro_seguradora (numero_do_sinistro));

-- parei aqui 

CREATE TABLE sinistro_seguradora(
numero_do_sinistro SERIAL, --(primary key)
tipo_do_sinistro TEXT,
classificacao_sinistro VARCHAR(2),
servicos_cobertos TEXT,
CONSTRAINT sinistro_seguradora_pkey PRIMARY KEY (numero_do_sinistro));


CREATE TABLE pericia_seguradora(
perito_responsavel VARCHAR(14), --(primary key e foreign key)
cliente_segurado VARCHAR(14), --(primary key e foreign key)
descricao_ocorrencia TEXT,
data_pericia DATE,
CONSTRAINT pericia_seguradora_pkey PRIMARY KEY (perito_responsavel, cliente_segurado));


CREATE TABLE reparo_seguradora(
oficina_responsavel VARCHAR(20), --(primary key e foreign key)
cliente_segurado VARCHAR(14), --(primary key e foreign key)
sinistro_realizado INTEGER, --(foreign key)
descricao_servicos TEXT,
data_servico DATE,
CONSTRAINT reparo_seguradora PRIMARY KEY (oficina_responsavel, cliente_segurado));


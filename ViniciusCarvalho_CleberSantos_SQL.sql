CREATE TABLE Equipamentos (
    id_equipamento INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INT,
    TipoEquipamento_ID INT,
    Equipamento_marca VARCHAR(50),
    Equipamento_modelo VARCHAR(50),
    Descricao TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Servicos (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INT,
    Tecnico_ID INT,
    OS_data_abertura DATE,
    OS_data_fechamento DATE,
    OS_status VARCHAR(20),
    OS_descricao_problema TEXT,
    OS_solucao TEXT,
    id_equipamento INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamentos (id_equipamento)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_nome VARCHAR(100),
    Cliente_email VARCHAR(100),
    Cliente_telefone VARCHAR(20),
    Cliente_endereco TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE FuncionarioCargos (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Tecnico_nome VARCHAR(100),
    Tecnico_telefone VARCHAR(20),
    Tecnico_comissao DECIMAL(10,2),
    Salario_valor DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ModalidadeTransacoes (
    id_modalidade INT PRIMARY KEY AUTO_INCREMENT,
    Modalidade VARCHAR(20),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE RecebimentoPagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE,
    valor DECIMAL(10,2),
    Pagamento_recebim_fk BOOLEAN,
    id_modalidade INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_modalidade) REFERENCES ModalidadeTransacoes (id_modalidade)
);

CREATE TABLE Entregas (
    id_entrega INT PRIMARY KEY AUTO_INCREMENT,
    Data_Entrega DATE,
    endereco_entrega VARCHAR(200),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Carrinhos (
    id_carrinho INT PRIMARY KEY AUTO_INCREMENT,
    Produto_Servico TEXT,
    id_entrega INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_entrega) REFERENCES Entregas (id_entrega)
);

CREATE TABLE FuncionarioServicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_servico INT,
    Tecnico_ID INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_servico) REFERENCES Servicos (id_servico),
    FOREIGN KEY(Tecnico_ID) REFERENCES FuncionarioCargos (id_funcionario)
);

CREATE TABLE PagamentoModalidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_modalidade INT,
    id_pagamento INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_modalidade) REFERENCES ModalidadeTransacoes (id_modalidade),
    FOREIGN KEY(id_pagamento) REFERENCES RecebimentoPagamentos (id_pagamento)
);

CREATE TABLE CarrinhoServicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_carrinho INT,
    id_servico INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_carrinho) REFERENCES Carrinhos (id_carrinho),
    FOREIGN KEY(id_servico) REFERENCES Servicos (id_servico)
);

CREATE TABLE CarrinhoPagamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_carrinho INT,
    id_pagamento INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_carrinho) REFERENCES Carrinhos (id_carrinho),
    FOREIGN KEY(id_pagamento) REFERENCES RecebimentoPagamentos (id_pagamento)
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque_atual INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ProdutoCarrinhos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_carrinho INT,
    id_produto INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_carrinho) REFERENCES Carrinhos (id_carrinho),
    FOREIGN KEY(id_produto) REFERENCES Produtos (id_produto)
);

CREATE TABLE ClienteCarrinhos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_carrinho INT,
    id_cliente INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_carrinho) REFERENCES Carrinhos (id_carrinho),
    FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
);

CREATE TABLE Empresas (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cnpj VARCHAR(14),
    missao TEXT,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE PlanoFinanceiros (
    id_plano_financeiro INT PRIMARY KEY AUTO_INCREMENT,
    id_plano_negocio INT,
    id_empresa INT,
    investimento_inicial DECIMAL(10,2),
    custos_fixos DECIMAL(10,2),
    custos_variaveis DECIMAL(10,2),
    receitas_previstas DECIMAL(10,2),
    lucro_estimado DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE
);

CREATE TABLE PlanoOperacionals (
    id_plano_operacional INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    id_plano_negocio INT,
    Descricao_atividade TEXT,
    equipamentos TEXT,
    pessoal_envolvido TEXT,
    localizacao TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE
);

CREATE TABLE RedeAtividades (
    id_rede_atividades INT PRIMARY KEY AUTO_INCREMENT,
    id_plano_negocio INT,
    id_empresa INT,
    Descricao TEXT,
    Atividade_principal TEXT,
    Atividades_auxiliares TEXT,
    responsaveis TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE
);

CREATE TABLE PlanoNegocios (
    id_plano_negocio INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    id_plano_financeiro INT,
    id_plano_operacional INT,
    id_rede_atividade INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE,
    FOREIGN KEY(id_plano_financeiro) REFERENCES PlanoFinanceiros (id_plano_financeiro),
    FOREIGN KEY(id_plano_operacional) REFERENCES PlanoOperacionals (id_plano_operacional),
    FOREIGN KEY(id_rede_atividade) REFERENCES RedeAtividades (id_rede_atividades)
);

CREATE TABLE Objetivos (
    id_objetivo INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    Descricao TEXT,
    id_plano_negocio INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE,
    FOREIGN KEY(id_plano_negocio) REFERENCES PlanoNegocios (id_plano_negocio)
);

CREATE TABLE Despesas (
    id_despesa INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    Descricao TEXT,
    valor DECIMAL(10,2),
    data_vencimento DATE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE
);

CREATE TABLE EmpresaRecebimentoPagamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    id_pagamento INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE,
    FOREIGN KEY(id_pagamento) REFERENCES RecebimentoPagamentos (id_pagamento)
);

CREATE TABLE Impostos (
    id_impostos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    percentual INT,
    id_empresa INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(id_empresa) REFERENCES Empresas (id_empresa) ON DELETE CASCADE
);

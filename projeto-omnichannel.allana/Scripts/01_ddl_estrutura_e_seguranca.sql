CREATE DATABASE IF NOT EXISTS omnichannel_db;
USE omnichannel_db;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lojas (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('Física', 'Online') NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque_atual INT NOT NULL DEFAULT 0
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT NOT NULL,
    id_loja INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status ENUM('Pendente', 'Concluido', 'Cancelado') DEFAULT 'Pendente',
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_loja FOREIGN KEY (id_loja) REFERENCES lojas(id_loja)
);

CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE auditoria_preco (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    preco_antigo DECIMAL(10,2) NOT NULL,
    preco_novo DECIMAL(10,2) NOT NULL,
    data_alteracao DATETIME NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    CONSTRAINT fk_auditoria_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE USER IF NOT EXISTS 'atendente_omni'@'localhost' IDENTIFIED BY 'Senha123!';
GRANT SELECT ON omnichannel_db.produtos TO 'atendente_omni'@'localhost';
GRANT SELECT ON omnichannel_db.clientes TO 'atendente_omni'@'localhost';
FLUSH PRIVILEGES;
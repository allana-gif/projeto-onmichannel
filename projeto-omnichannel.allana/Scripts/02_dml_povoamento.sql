USE omnichannel_db;

INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('Ana Souza', '111.222.333-44', 'ana.souza@email.com', '(11) 98888-1111'),
('Carlos Lima', '222.333.444-55', 'carlos.lima@email.com', '(11) 98888-2222'),
('Beatriz Costa', '333.444.555-66', 'beatriz.costa@email.com', '(11) 98888-3333'),
('Daniel Dias', '444.555.666-77', 'daniel.dias@email.com', '(11) 98888-4444'),
('Elena Rocha', '555.666.777-88', 'elena.rocha@email.com', '(11) 98888-5555');

INSERT INTO lojas (nome, tipo, cidade, uf) VALUES
('VarejoOmni Paulista', 'Física', 'São Paulo', 'SP'),
('VarejoOmni Centro', 'Física', 'Campinas', 'SP'),
('VarejoOmni Barra', 'Física', 'Rio de Janeiro', 'RJ'),
('E-commerce Nacional', 'Online', 'São Paulo', 'SP'),
('VarejoOmni Savassi', 'Física', 'Belo Horizonte', 'MG');

INSERT INTO produtos (nome, categoria, preco, estoque_atual) VALUES
('Smartphone Galaxy S23', 'Eletrônicos', 4500.00, 15),
('Notebook Dell Inspiron', 'Informatica', 3800.00, 8),
('Fone de Ouvido Bluetooth', 'Acessórios', 250.00, 30),
('Smart TV 50 Polegadas', 'Eletrônicos', 2900.00, 10),
('Cadeira Gamer Ergonômica', 'Móveis', 1200.00, 12);

INSERT INTO pedidos (id_cliente, id_loja, valor_total, status) VALUES
(1, 4, 4750.00, 'Concluido'),
(2, 1, 3800.00, 'Concluido'),
(3, 4, 250.00, 'Pendente'),
(4, 2, 2900.00, 'Concluido'),
(5, 5, 1200.00, 'Concluido');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00),
(1, 3, 1, 250.00),
(2, 2, 1, 3800.00),
(4, 4, 1, 2900.00),
(5, 5, 1, 1200.00);
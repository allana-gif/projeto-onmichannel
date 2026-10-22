USE omnichannel_db;

DELIMITER //

CREATE PROCEDURE sp_registrar_venda (
    IN p_id_cliente INT,
    IN p_id_loja INT,
    IN p_id_produto INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_preco DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_pedido INT;

    SELECT preco INTO v_preco FROM produtos WHERE id_produto = p_id_produto;
    SET v_total = v_preco * p_quantidade;

    INSERT INTO pedidos (id_cliente, id_loja, valor_total, status) 
    VALUES (p_id_cliente, p_id_loja, v_total, 'Concluido');

    SET v_id_pedido = LAST_INSERT_ID();

    INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
    VALUES (v_id_pedido, p_id_produto, p_quantidade, v_preco);

    UPDATE produtos 
    SET estoque_atual = estoque_atual - p_quantidade 
    WHERE id_produto = p_id_produto;
END //

CREATE TRIGGER trg_auditoria_preco
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco THEN
        INSERT INTO auditoria_preco (id_produto, preco_antigo, preco_novo, data_alteracao, usuario)
        VALUES (OLD.id_produto, OLD.preco, NEW.preco, NOW(), USER());
    END IF;
END //

DELIMITER ;
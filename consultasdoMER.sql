DELETE FROM pessoa_fisica WHERE id = 1;
DELETE FROM pessoa_juridica;
DELETE FROM cliente WHERE tipo_cliente = 'Pessoa Física';
DELETE FROM livro WHERE ano_publicacao < 2010;
DELETE FROM Aluga WHERE aluguel < 10;


UPDATE cliente SET telefone = '(11) 9876-5432' WHERE id = 1;
UPDATE livro SET preco_venda = 60.00 WHERE id = 1;
UPDATE Reserva SET data_hora = '2023-04-17 15:30:00' WHERE id = 2;
UPDATE Compra SET preco = 80.00, data_hora = '2023-04-21 14:00:00' WHERE id = 1;

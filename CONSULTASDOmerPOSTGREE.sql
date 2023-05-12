INSERT INTO pessoa_fisica (data_nascimento, nome, cpf)
VALUES ('1990-05-25', 'João da Silva', '123.456.789-00'),
('1985-12-15', 'Maria Souza', '987.654.321-00');

-- Inserir exemplos na tabela pessoa_juridica
INSERT INTO pessoa_juridica (cnpj, razao_social)
VALUES ('12.345.678/0001-01', 'Empresa A'),
('98.765.432/0001-02', 'Empresa B');

-- Inserir exemplos na tabela cliente
INSERT INTO cliente (nome, telefone, email, endereco, tipo_cliente, id_pessoa_fisica, id_pessoa_juridica)
VALUES ('João da Silva', '(11) 9999-8888', 'joao.silva@email.com', 'Rua A, 123', 'Pessoa Física', 1, NULL),
('Empresa A', '(11) 2222-3333', 'empresa@a.com', 'Rua B, 456', 'Pessoa Jurídica', NULL, 1),
('Maria Souza', '(11) 7777-6666', 'maria.souza@email.com', 'Rua C, 789', 'Pessoa Física', 2, NULL);

-- Inserir exemplos na tabela livro
INSERT INTO livro (autor, editora, nome, ano_publicacao, nacional_internacional, quantidade, preco_venda, preco_aluguel, preco_renovacao)
VALUES ('Autor A', 'Editora X', 'Livro 1', 2005, 'Nacional', 10, 50.00, 5.00, 2.50),
('Autor B', 'Editora Y', 'Livro 2', 2010, 'Internacional', 5, 80.00, 8.00, 4.00);

-- Inserir exemplos na tabela Aluga
INSERT INTO Aluga (data_hora, aluguel)
VALUES ('2023-04-23 14:30:00', 10.00),
('2023-04-22 10:00:00', 5.00);

-- Inserir exemplos na tabela Compra
INSERT INTO Compra (preco, data_hora)
VALUES (100.00, '2023-04-21 16:00:00'),
(50.00, '2023-04-20 09:30:00');

-- Inserir exemplos na tabela Reserva
INSERT INTO Reserva (data_hora)
VALUES ('2023-04-19 14:00:00'),
('2023-04-18 11:00:00');

DELETE FROM pessoa_fisica WHERE id = 1;
DELETE FROM pessoa_juridica;
DELETE FROM cliente WHERE tipo_cliente = 'Pessoa Física';
DELETE FROM livro WHERE ano_publicacao < 2010;
DELETE FROM Aluga WHERE aluguel < 10;

UPDATE cliente SET telefone = '(11) 9876-5432' WHERE id = 1;
UPDATE livro SET preco_venda = 60.00 WHERE id = 1;
UPDATE Reserva SET data_hora = '2023-04-17 15:30:00' WHERE id = 2;
UPDATE Compra SET preco = 80.00, data_hora = '2023-04-21 14:00:00' WHERE id = 1;
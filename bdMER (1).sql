create database projetoMER;
use projetoMER;

CREATE TABLE pessoa_fisica (
  id INT NOT NULL AUTO_INCREMENT,
  data_nascimento DATE NOT NULL,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  PRIMARY KEY (id)
  );
  
CREATE TABLE pessoa_juridica (
  id INT NOT NULL AUTO_INCREMENT,
  cnpj VARCHAR(14) NOT NULL,
  razao_social VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  tipo_cliente ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,
  id_pessoa_fisica INT,
  id_pessoa_juridica INT,
  PRIMARY KEY (id),
  FOREIGN KEY (id_pessoa_fisica) REFERENCES pessoa_fisica(id),
  FOREIGN KEY (id_pessoa_juridica) REFERENCES pessoa_juridica(id)
);

CREATE TABLE livro (
  id INT NOT NULL AUTO_INCREMENT,
  autor VARCHAR(255) NOT NULL,
  editora VARCHAR(255) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  ano_publicacao YEAR NOT NULL,
  nacional_internacional ENUM('Nacional', 'Internacional') NOT NULL,
  quantidade INT NOT NULL,
  preco_venda DECIMAL(10,2) NOT NULL,
  preco_aluguel DECIMAL(10,2) NOT NULL,
  preco_renovacao DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Aluga (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  aluguel DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE Compra (
  id INT NOT NULL AUTO_INCREMENT,
  preco DECIMAL(10,2) NOT NULL,
  data_hora DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Reserva (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  PRIMARY KEY (id)
);


-- Inserir exemplos na tabela pessoa_fisica
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

-- Exemplo 1: inserir um livro nacional
INSERT INTO livro (autor, editora, nome, ano_publicacao, nacional_internacional, quantidade, preco_venda, preco_aluguel, preco_renovacao)
VALUES ('Machado de Assis', 'Nova Fronteira', 'Dom Casmurro', 1899, 'Nacional', 20, 35.90, 2.50, 1.50);

-- Exemplo 2: inserir um livro internacional
INSERT INTO livro (autor, editora, nome, ano_publicacao, nacional_internacional, quantidade, preco_venda, preco_aluguel, preco_renovacao)
VALUES ('J.K. Rowling', 'Scholastic', 'Harry Potter and the Philosopher''s Stone', 1997, 'Internacional', 15, 50.00, 5.00, 2.50);

-- Exemplo 3: inserir um livro com preço de venda diferente do preço de aluguel
INSERT INTO livro (autor, editora, nome, ano_publicacao, nacional_internacional, quantidade, preco_venda, preco_aluguel, preco_renovacao)
VALUES ('George R.R. Martin', 'Bantam Books', 'A Game of Thrones', 1996, 'Internacional', 10, 60.00, 10.00, 5.00);

SELECT * FROM pessoa_fisica;
SELECT * FROM pessoa_juridica;
SELECT * FROM cliente;
SELECT * FROM livro;
SELECT * FROM Aluga;
SELECT * FROM Compra;
SELECT * FROM Reserva;
SELECT * FROM cliente WHERE tipo_cliente = 'Pessoa Física';
SELECT * FROM cliente WHERE tipo_cliente = 'Pessoa Jurídica';
SELECT * FROM livro WHERE nacional_internacional = 'Nacional' AND quantidade > 0;
SELECT * FROM livro WHERE nacional_internacional = 'Internacional' AND quantidade > 0 AND preco_venda > 0;
SELECT * FROM Compra WHERE YEAR(data_hora) = 2023 AND MONTH(data_hora) = 4;
SELECT * FROM Reserva ORDER BY data_hora DESC;
SELECT * FROM pessoa_fisica ORDER BY nome;
SELECT * FROM livro WHERE nome LIKE '%Java%';

UPDATE cliente
SET nome = 'Novo Nome'
WHERE id = 1;

UPDATE livro
SET preco_venda = 60.00
WHERE id = 1;

DELETE FROM cliente
WHERE id = 2;

DELETE FROM livro
WHERE id = 2;


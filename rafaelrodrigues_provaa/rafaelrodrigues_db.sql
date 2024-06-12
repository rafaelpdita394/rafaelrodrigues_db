-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS rafaelrodrigues;
USE rafaelrodrigues;

-- Criação da Tabela de Usuários
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nick_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Inserção dos Dados de Usuários
INSERT INTO users (nome, nick_name, email, telefone, senha) VALUES
('usuario1', 'user1', 'user1@user.com', '1111111111', 'usuario1111'),
('usuario2', 'user2', 'user2@user.com', '2222222222', 'usuario2222'),
('usuario3', 'user3', 'user3@user.com', '3333333333', 'usuario3333'),
('usuario4', 'user4', 'user4@user.com', '4444444444', 'usuario4444'),
('usuario5', 'user5', 'user5@user.com', '5555555555', 'usuario5555'),
('usuario6', 'user6', 'user6@user.com', '6666666666', 'usuario6666'),
('usuario7', 'user7', 'user7@user.com', '7777777777', 'usuario7777'),
('usuario8', 'user8', 'user8@user.com', '8888888888', 'usuario8888'),
('usuario9', 'user9', 'user9@user.com', '9999999999', 'usuario9999');

-- Criação da Tabela de Fotos
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255) NOT NULL
);

-- Inserção dos Dados de Fotos
INSERT INTO photos (filename) VALUES
('itália.jpg'),
('oceano_da_califórnia.jpg'),
('lago2.jpg'),
('alaska.jpg'),
('parque_denali.jpg'),
('lago.jpg'),
('escócia.jpg'),
('montanhoso.jpg'),
('montanhas.jpg');

-- Criação das Tabelas de Curtidas e Comentários
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    photo_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    photo_id INT,
    comment TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

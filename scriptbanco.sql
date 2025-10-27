CREATE DATABASE IF NOT EXISTS BallonDorDB;
USE BallonDorDB;

-- 🌍 Nacionalidade do jogador
CREATE TABLE IF NOT EXISTS Nacionalidade (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL UNIQUE
);

-- 🧩 Posição em campo
CREATE TABLE IF NOT EXISTS Posicao (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL UNIQUE
);

-- 🏟️ Clube (antigo Tipo)
CREATE TABLE IF NOT EXISTS Clube (
	Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL UNIQUE,
	Imagem VARCHAR(200)
);


-- 🧍‍♂️ Jogador (antigo Pokemon)
CREATE TABLE IF NOT EXISTS Jogador (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    NacionalidadeId INT UNSIGNED NOT NULL,
    PosicaoId INT UNSIGNED NOT NULL,
    Altura DOUBLE(4,2) DEFAULT 0, -- metros
    Imagem VARCHAR(200), -- foto do jogador
    Descricao TEXT, -- biografia/carreira
    FOREIGN KEY (NacionalidadeId) REFERENCES Nacionalidade(Id),
    FOREIGN KEY (PosicaoId) REFERENCES Posicao(Id)
);

-- ⚽ Relação Jogador-Clube (antigo PokemonTipo)
CREATE TABLE IF NOT EXISTS JogadorClube (
    JogadorId INT UNSIGNED NOT NULL,
    ClubeId INT UNSIGNED NOT NULL,
    AnoInicio YEAR,
    AnoFim YEAR,
    PRIMARY KEY (JogadorId, ClubeId),
    FOREIGN KEY (JogadorId) REFERENCES Jogador(Id),
    FOREIGN KEY (ClubeId) REFERENCES Clube(Id)
);

-- 🏆 Prêmios (Bola de Ouro, The Best etc.)
CREATE TABLE IF NOT EXISTS Premio (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Ano YEAR NOT NULL,
    JogadorId INT UNSIGNED NOT NULL,
    FOREIGN KEY (JogadorId) REFERENCES Jogador(Id)
);

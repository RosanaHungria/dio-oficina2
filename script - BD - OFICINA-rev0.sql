-- Criação do Banco de Dados para OFICINA
CREATE DATABASE IF NOT EXISTS `OFICINA`;
USE `OFICINA`;

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL COMMENT 'Armazena informações sobre os clientes da oficina.',
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
);

-- Tabela Veiculo
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL UNIQUE,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  FOREIGN KEY (`idCliente`) REFERENCES `Cliente`(`idCliente`)
);

-- Tabela Equipe
CREATE TABLE IF NOT EXISTS `Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEquipe`)
);

-- Tabela OrdemServico
CREATE TABLE IF NOT EXISTS `OrdemServico` (
  `idOrdemServico` INT NOT NULL AUTO_INCREMENT,
  `dataEmissao` DATETIME NOT NULL,
  `dataConclusao` DATETIME,
  `valorTotal` DECIMAL(10,2),
  `status` ENUM('pendente', 'em_execucao', 'concluida', 'cancelada') NOT NULL,
  `idVeiculo` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  `clienteAprova` ENUM('SIM', 'NAO') NOT NULL,
  `tipoOS` ENUM('CONSERTO', 'REVISAO') NOT NULL DEFAULT 'CONSERTO',
  PRIMARY KEY (`idOrdemServico`),
  FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo`(`idVeiculo`),
  FOREIGN KEY (`idEquipe`) REFERENCES `Equipe`(`idEquipe`)
);

-- Tabela Mecanico
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `idEquipe` INT NOT NULL,
  PRIMARY KEY (`idMecanico`),
  FOREIGN KEY (`idEquipe`) REFERENCES `Equipe`(`idEquipe`)
);

-- Tabela Servico
CREATE TABLE IF NOT EXISTS `Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idServico`)
);

-- Tabela ServicosOrdemServico
CREATE TABLE IF NOT EXISTS `ServicosOrdemServico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idServico` INT NOT NULL,
  `idOrdemServico` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idServico`) REFERENCES `Servico`(`idServico`),
  FOREIGN KEY (`idOrdemServico`) REFERENCES `OrdemServico`(`idOrdemServico`)
);

-- Tabela Peca
CREATE TABLE IF NOT EXISTS `Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idPeca`)
);

-- Tabela PecasOrdemServico
CREATE TABLE IF NOT EXISTS `PecasOrdemServico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idPeca` INT NOT NULL,
  `idOrdemServico` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idPeca`) REFERENCES `Peca`(`idPeca`),
  FOREIGN KEY (`idOrdemServico`) REFERENCES `OrdemServico`(`idOrdemServico`)
);




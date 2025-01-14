-- Inserindo clientes
INSERT INTO `Cliente` (`nome`, `telefone`, `email`, `endereco`) VALUES
('João Silva', '123456789', 'joao@example.com', 'Rua A, 123'),
('Maria Oliveira', '987654321', 'maria@example.com', 'Rua B, 456');

-- Inserindo veículos
INSERT INTO `Veiculo` (`placa`, `modelo`, `ano`, `idCliente`) VALUES
('ABC1234', 'Gol', 2020, 1),
('XYZ5678', 'Civic', 2018, 2);

-- Inserindo equipes
INSERT INTO `Equipe` (`nome`) VALUES
('Equipe Alfa'),
('Equipe Beta');

-- Inserindo mecânicos
INSERT INTO `Mecanico` (`nome`, `endereco`, `especialidade`, `idEquipe`) VALUES
('Carlos Lima', 'Rua C, 789', 'Motor', 1),
('Ana Souza', 'Rua D, 321', 'Suspensão', 2);

-- Inserindo serviços
INSERT INTO `Servico` (`descricao`, `valor`) VALUES
('Troca de óleo', 150.00),
('Alinhamento', 80.00);

-- Inserindo peças
INSERT INTO `Peca` (`descricao`, `valor`) VALUES
('Filtro de óleo', 30.00),
('Pneu', 400.00);

-- Inserindo ordens de serviço
INSERT INTO `OrdemServico` (`dataEmissao`, `dataConclusao`, `valorTotal`, `status`, `idVeiculo`, `idEquipe`, `clienteAprova`, `tipoOS`) VALUES
('2025-01-01 10:00:00', '2025-01-02 15:00:00', 230.00, 'concluida', 1, 1, 'SIM', 'CONSERTO'),
('2025-01-05 09:00:00', NULL, NULL, 'pendente', 2, 2, 'NAO', 'REVISAO');


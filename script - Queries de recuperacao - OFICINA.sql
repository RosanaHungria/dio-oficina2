--- Recuperação simples
SELECT * FROM Cliente;

---- Filtro com WHERE:
SELECT * FROM Veiculo WHERE ano > 2019;

----- Atributo derivado:
SELECT descricao, valor, (valor * 0.9) AS valorComDesconto FROM Servico;

----- Ordenação:
SELECT * FROM Cliente ORDER BY nome ASC;

--- Filtro por grupo (HAVING):
SELECT Cliente.nome AS cliente, Veiculo.idCliente, COUNT(*) AS totalVeiculos
FROM Veiculo
JOIN Cliente ON Veiculo.idCliente = Cliente.idCliente
GROUP BY Cliente.nome, Veiculo.idCliente
HAVING totalVeiculos >= 1;


---- Junções:
SELECT Cliente.nome AS cliente, Veiculo.modelo AS veiculo, OrdemServico.valorTotal
FROM OrdemServico
JOIN Veiculo ON OrdemServico.idVeiculo = Veiculo.idVeiculo
JOIN Cliente ON Veiculo.idCliente = Cliente.idCliente;


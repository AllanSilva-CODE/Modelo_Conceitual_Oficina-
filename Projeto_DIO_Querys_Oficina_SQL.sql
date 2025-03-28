# Querys em sql para informaçoes do banco de dados "Oficina"

USE Oficina;
SHOW TABLES;


# Informaçoes sobre o carro e o preço do serviço
SELECT CONCAT(Fname,' ',Lname) as Nome,City,Model,Plate,Status_serviço,o.Valor_total,
	(SELECT sum(o.Valor_total)from Ordemserviço o) as Faturamento_da_Oficina
from Cliente c
join Veiculo v on c.Idcliente=v.Idcliente
join Ordemserviço o on v.Idveiculo=o.Idveiculo;

# Informaçoes sobre o carro 'Palio'
SELECT CONCAT(c.Fname,' ',c.Lname) as Nome,c.City,Model,Plate,Status_serviço,Valor_total,Serviço,
Preço_serviço,concat(m.Fname,' ',m.Lname) as Mecanico,Especialidade
from Cliente c
join Veiculo v on c.Idcliente=v.Idcliente
join Ordemserviço o on v.Idveiculo=o.Idveiculo
join ordemserviço_serviços_mecanicos osm on o.Idordemserviço=osm.Idordemserviço
join serviços s on osm.Idserviço=s.Idserviço
join mecanicos m on osm.Idmecanico=m.Idmecanico
where Model='Palio';

# Clientes e seus Feedbacks
SELECT concat(Fname,' ',Lname) as Cliente, City, Model,Color, Rating, Comentario
from Cliente c
join Veiculo v on c.Idcliente = v.Idcliente
join Feedback f on c.Idcliente = f.Idcliente;

# as peças que os carros utilizaram
SELECT CONCAT(c.Fname,' ',c.Lname) AS Nome,GROUP_CONCAT(DISTINCT v.Model) AS Model,
GROUP_CONCAT(DISTINCT v.Plate) AS Plate,p.Nome_peça,
COUNT(Quantidade_peça) AS Quantidade_peça,Preço_Peça,Count(Quantidade_peça) * Preço_peça as Preço_peças,o.Total_peça
FROM Cliente c
JOIN Veiculo v ON c.Idcliente = v.Idcliente
JOIN Ordemserviço o ON v.Idveiculo = o.Idveiculo
JOIN ordemserviço_peças op ON o.Idordemserviço = op.Idordemserviço
JOIN Peças p ON op.Idpeça = p.Idpeça
where Model='HB20'    
GROUP BY c.Idcliente,Nome_peça,Total_peça;

# Listar os fornecedores de acordo com as unidades de peças no estoque:
SELECT F.Nome_fornecedor
FROM Fornecedores F
WHERE EXISTS (
    SELECT 1
    FROM Fornecedor_peças FP
    WHERE FP.Idfornecedor = F.Idfornecedor
    AND FP.quantidade_peças > 5
);

# Número de peças vendidas para cada fornecedor
SELECT F.Nome_fornecedor, SUM(FP.quantidade_peças) AS Total_peças_vendidas
FROM Fornecedores F
JOIN Fornecedor_peças FP ON F.Idfornecedor = FP.Idfornecedor
GROUP BY F.Nome_fornecedor
order by Total_peças_vendidas desc;

# Pagamentos dos clientes
SELECT concat(Fname,' ',Lname) as Cliente, Model,Plate, Valor_pago,Forma_pagamento,Status_pagamento,Valor_total
From Cliente c
join Veiculo v on c.Idcliente=v.Idcliente
join Ordemserviço o on v.Idveiculo=o.Idveiculo
join Pagamentos p on o.Idordemserviço=p.Idordemserviço;

# Carros que os mecanicos trabalharam
SELECT CONCAT(m.Fname, ' ', m.Lname) AS mecanicos, Especialidade, Salary,
round(AVG(m.Salary) OVER (),2) AS avg_Salary, -- Média de todos os salários tirada da tabela 'Mecanicos'
v.Model,s.Serviço,
    (SELECT SUM(Salary) FROM Mecanicos) AS Total_salario_mecanicos 
FROM Mecanicos m 
JOIN Ordemserviço_serviços_mecanicos osm ON m.Idmecanico = osm.Idmecanico
JOIN Ordemserviço o ON osm.Idordemserviço = o.Idordemserviço
JOIN Veiculo v ON o.Idveiculo = v.Idveiculo
JOIN Serviços s ON osm.Idserviço = s.Idserviço
ORDER BY m.Salary DESC;


# Buscar fornecedores po peça
SELECT Nome_fornecedor,Nome_peça,
    SUM(Quantidade_peças) AS Quantidade_peças,
    Preço_peça,
    SUM(Quantidade_peças * Preço_peça) AS Total,
    (SELECT SUM(Quantidade_peças * Preço_peça) 
     FROM fornecedores f2
     JOIN Fornecedor_peças fp2 ON f2.Idfornecedor = fp2.Idfornecedor
     JOIN Peças p2 ON fp2.Idpeça = p2.Idpeça) AS Soma_Total_Peças
FROM fornecedores f
JOIN Fornecedor_peças fp ON f.Idfornecedor = fp.Idfornecedor
JOIN Peças p ON fp.Idpeça = p.Idpeça
GROUP BY Nome_fornecedor, Nome_peça, Preço_peça
ORDER BY Total desc;

# Usando o Having para ver quanto cada cliente pagou
SELECT p.Idordemserviço, SUM(p.Valor_pago) AS Total_pago
FROM Pagamentos p
GROUP BY p.Idordemserviço
HAVING SUM(p.Valor_pago) > 500.00;

#  Encontrar mecânicos com mais de duas ordens de serviço concluídas
SELECT m.Idmecanico,m.Fname,m.Lname,
    COUNT(os.Idordemserviço) AS Numero_ordens_concluidas
FROM Mecanicos m
JOIN Ordemserviço_serviços_mecanicos ossm ON m.Idmecanico = ossm.Idmecanico
JOIN Ordemserviço os ON ossm.Idordemserviço = os.Idordemserviço
WHERE os.Status_serviço = 'concluído'
GROUP BY m.Idmecanico, m.Fname, m.Lname
HAVING COUNT(os.Idordemserviço) > 2;

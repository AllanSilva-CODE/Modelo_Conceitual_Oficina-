# Persistindo dados nas tabelas do Banco de dados "Oficina"

USE Oficina;
Show TABLES;
# ---------------

DESC Cliente;
SELECT * from Cliente;
INSERT INTO Cliente (Fname, Lname, City, Neighborhood, Road, Date_of_birth, Phone) VALUES
('Carlos', 'Silva', 'Fortaleza', 'Aldeota', 'Rua 1', '1985-03-15', '11987654321'),
('Ana', 'Costa', 'Caucaia', 'central', 'Avenida Atlântica', '1990-07-23', '21987654321'),
('José', 'Oliveira', 'Caucaia', 'central', 'Rua da Liberdade', '1983-11-01', '31987654321'),
('Mariana', 'Fernandes', 'Fortaleza', 'Meireles', 'Rua das Flores', '1992-06-12', '41987654321'),
('Lucas', 'Souza', 'Fortaleza', 'Aldeota', 'Rua Dr. José Frota', '1988-04-10', '85987654321'),
('Patrícia', 'Lima', 'Aquiraz', 'Moca', 'Rua dos Trilhos', '1982-02-28', '11976543210'),
('Gabriel', 'Martins', 'Pacajus', 'Pituba', 'Rua do Beco', '1995-12-10', '71987654322'),
('Fernanda', 'Pereira', 'Itaitinga', 'Cidade Baixa', 'Rua dos Açores', '1987-08-25', '51987654321'),
('Paulo', 'Dias','Sao gonçalo do amarante','Pecem', 'Quadra 309', '1991-01-16', '61987654321'),
('Marcos','Assunçao','Fortaleza','Centro','Rua 121','1999-09-29','12345621672'); # 10 clientes


DESC Veiculo;
SELECT * from Veiculo;
INSERT INTO Veiculo (Model, Plate, Mark, Color, Year_veiculo, Idcliente) VALUES
('Civic', 'ABC1234', 'Honda', 'Preto', 2020, 1),
('Fusion', 'XYZ5678', 'Ford', 'Prata', 2018, 2),
('Gol', 'DEF2345', 'Volkswagen', 'Vermelho', 2015, 3),
('Fiesta', 'GHI3456', 'Ford', 'Azul', 2021, 4),
('Kwid', 'JKL4567', 'Renault', 'Branco', 2020, 5),
('Onix', 'MNO5678', 'Chevrolet', 'Cinza', 2022, 6),
('Argo', 'PQR6789', 'Fiat', 'Preto', 2019, 7),
('HB20', 'STU7890', 'Hyundai', 'Amarelo', 2018, 8),
('A3', 'VWX8901', 'Audi', 'Verde', 2021, 9),
('Palio','PPP7711','FIAT','Prata','2021',10);

# Tem que fazer alter table para deixar a Status_serviço e Data_conclusao da tabela Ordemserviço concluidas
DESC Ordemserviço;
SELECT * from Ordemserviço;
INSERT INTO Ordemserviço (Data_emissao, Status_serviço, Quantidade_serviço, Total_serviço, Quantidade_peça, Total_peça, Valor_total, Data_conclusao, Idveiculo) VALUES
('2025-03-01 10:00:00', 'em andamento', 11, 5930.00, 7, 1040.00, 6970.00, NULL, 1),
('2025-03-01 11:30:00', 'concluído', 7, 2400.00, 6, 580.00, 2980.00, '2025-03-03 15:00:00', 2),
('2025-03-01 14:00:00', 'em andamento', 4, 5060.00, 4, 770.00, 5830.00, NULL, 3),
('2025-03-02 09:00:00', 'em andamento', 4, 12930.00, 2, 7550.00, 20480.00, NULL, 4),
('2025-03-02 13:45:00', 'concluído', 2, 1620.00, 2, 740.00, 2360.00, '2025-03-12 10:30:00', 5),
('2025-03-02 13:47:00', 'em andamento', 10, 4740.00, 6, 660.00, 5400.00, NULL, 6),
('2025-03-02 14:15:00', 'concluído', 3, 1190.00, 3, 850.00, 2040.00, '2025-03-12 10:30:00', 7),
('2025-03-03 08:00:00', 'em andamento', 10, 5520.00, 8, 2190.00, 7710.00, NULL, 8),
('2025-03-03 08:10:00', 'concluído', 5, 4600.00, 1, 80.00, 4680.00, '2025-03-12 10:30:00', 9),
('2025-03-03 09:45:00', 'em andamento', 18, 22450.00, 17, 8800.00, 31250.00, NULL, 10);



DESC Serviços;
SELECT * from Serviços;
INSERT INTO Serviços (Serviço, Descriçao_serviço, Preço_serviço) VALUES
('Troca de óleo', 'Substituição do óleo do motor e filtros', 120.00),
('Troca de filtro de ar', 'Substituição do filtro de ar do motor', 80.00),
('Troca de bateria', 'Checagem e troca da bateria', 1500.00),
('Troca de correia dentada', 'Substituição da correia dentada do motor', 300.00),
('Substituição de amortecedores', 'Troca dos amortecedores dianteiros e traseiros', 250.00),
('Troca de freio Unitario', 'Inspeção e troca de pastilhas de freio', 1200.00),
('Alinhamento e balanceamento', 'Ajuste da geometria e balanceamento das rodas', 40.00),
('Troca de óleo da direção hidráulica', 'Substituição do óleo da direção hidráulica', 120.00),
('Troca de fluido de arrefecimento', 'Substituição do fluido de arrefecimento do motor', 190.00),
('Troca de suspensões', 'Inspeção e verificação do sistema de suspensão', 690.00),
('Troca de pastilhas de freio traseiras', 'Substituição das pastilhas de freio traseiras', 500.00),
('Troca de filtro de combustível', 'Substituição do filtro de combustível do motor', 300.00),
('Troca de óleo da transmissão', 'Substituição do óleo da transmissão do veículo', 150.00),
('Substituição de lâmpada Unitario', 'Troca de lâmpadas do farol e luzes internas', 230.00),
('Troca de ar condicionado', 'troca de ar condicionado', 600.00),
('Troca de vela de ignição', 'Substituição das velas de ignição do motor', 300.00),
('Troca de direção', 'Ajuste do alinhamento da direção do veículo', 330.00),
('Substituição de coxins de motor', 'Troca dos coxins de motor para reduzir vibrações', 250.00),
('Troca de vidros','Troca de vidros quebrados e arranhados', 600.00),
('Colocaçao ou troca de peliculas','Peliculas em geral',340.00),
('Troca de motor','Troca de motor que tenha problemas',9000.00),
('Troca da caixa de marcha','Troca de caixa de marcha com problema',6000.00),
('Reparar amassados Unitario','depende do tamanho e quantidade de amassados',150.00),
('Troca da antena','antena com problemas em geral',1200.00),
('Troca de pintura','Pintura de qualquer cor',4000.00);


DESC Mecanicos;
SELECT * from Mecanicos;
INSERT INTO Mecanicos (Fname, Lname, Especialidade, Salary, CPF, City, Neighborhood, Road, Date_of_birth, Phone) VALUES
('Pedro', 'Gomes', 'motor', 4000.00, '12345678901', 'Fortaleza', 'Aldeota', 'Rua das Palmeiras', '1985-03-15', '11987654321'),
('Mario', 'Santos', 'transmissao', 2800.00, '23456789012', 'Fortaleza', 'Meireles', 'Avenida Atlântica', '1990-07-23', '21987654321'),
('João', 'Lima', 'suspensao', 3200.00, '34567890123', 'Fortaleza', 'Centro', 'Rua Minas Gerais', '1983-11-01', '31987654321'),
('Renato', 'Costa', 'freios', 2900.00, '45678901234', 'Fortaleza', 'Benfica', 'Rua das Flores', '1992-06-12', '41987654321'),
('Luciana', 'Pereira', 'eletrico', 3100.00, '56789012345', 'Fortaleza', 'Jardim Cearense', 'Rua dos Três Irmãos', '1988-04-10', '85987654321'),
('Eduardo', 'Ferreira', 'ar condicionado', 3300.00, '67890123456', 'Fortaleza', 'Barra do Ceará', 'Rua 15', '1984-02-20', '71987654322'),
('Fabiana', 'Martins', 'injeçao eletronica', 3200.00, '78901234567', 'Fortaleza', 'Cidade dos Funcionários', 'Rua São Pedro', '1995-12-10', '51987654321'),
('Ricardo', 'Dias', 'alinhamento e balaceamento', 2200.00, '89012345678', 'Fortaleza', 'Papicu', 'Quadra 308', '1991-01-16', '61987654321'),
('Carlos', 'Oliveira', 'motor', 3400.00, '90123456789', 'Fortaleza', 'Dionísio Torres', 'Rua do Sol', '1987-05-15', '91987654321'),
('Juliano', 'Sousa', 'transmissao', 3050.00, '10123456789', 'Fortaleza', 'Meireles', 'Avenida da Beira Mar', '1992-09-22', '92987654321'),
('Marcos', 'Silva', 'freios', 2800.00, '11234567890', 'Fortaleza', 'Parangaba', 'Rua Professor Antônio José', '1986-01-12', '93987654321'),
('Ana', 'Carvalho', 'injeçao eletronica', 2900.00, '12377678901', 'Fortaleza', 'Bom Jardim', 'Rua Ceará', '1990-03-07', '94987654321'),
('Felipe', 'Alves', 'suspensao', 3100.00, '13456789012', 'Fortaleza', 'Aldeota', 'Rua do Limoeiro', '1984-11-04', '95987654321'),
('Renato', 'Melo', 'vidro e carroceria', 3300.00, '14567890123', 'Fortaleza', 'Meireles', 'Rua dos Três Irmãos', '1995-07-10', '96987654321'),
('Paulo', 'Santos', 'alinhamento e balaceamento', 2200.00, '15678901234', 'Fortaleza', 'José de Alencar', 'Rua Morada Nova', '1989-02-25', '97987654321'),
('Tatiane', 'Costa', 'freios', 3100.00, '16789012345', 'Fortaleza', 'Maraponga', 'Avenida Deputado Paulino Rocha', '1992-04-12', '98987654321'),
('Ricardo', 'Matos', 'pneu', 3200.00, '17890123456', 'Fortaleza', 'Messejana', 'Rua Tabelião Pedro Couto', '1987-01-19', '99987654321'),
('Daniela', 'Oliveira', 'vidro e carroceria', 3900.00, '18901234567', 'Fortaleza', 'Vila Velha', 'Rua Antônio Pompeu', '1994-06-15', '10898765432'),
('Samuel', 'Rocha', 'injeçao eletronica', 2800.00, '19012345678', 'Fortaleza', 'Serrinha', 'Rua São José', '1986-12-13', '11898765432'),
('Joao', 'Pereira', 'alinhamento e balaceamento', 2200.00, '20123456789', 'Fortaleza', 'Jardim das Oliveiras', 'Rua Pedro I', '1990-05-20', '12898765432'),
('Leonardo', 'Martins', 'freios', 2700.00, '21234567890', 'Fortaleza', 'Centro', 'Avenida Beira Mar', '1991-08-25', '13898765432'),
('Cláudia', 'Costa', 'suspensao', 3250.00, '22345678901', 'Fortaleza', 'Cidade dos Funcionários', 'Rua dos Pintores', '1988-03-14', '14898765432'),
('Maurício', 'Ferreira', 'ar condicionado', 2500.00, '23456789772', 'Fortaleza', 'José Bonifácio', 'Rua 7 de Setembro', '1982-04-09', '15898765432');


DESC Fornecedores;
SELECT * from Fornecedores;
INSERT INTO Fornecedores (Nome_fornecedor, CNPJ, City, Neighborhood, Road, Phone) VALUES
('Auto Peças Ltda', '12345678000195', 'São Paulo', 'Vila Progredior', 'Rua das Flores', '11987654321'),
('Peças e Serviços S/A', '23456789000101', 'Salvador', 'Copacabana', 'Avenida Atlântica', '21987654322'),
('Auto Mercado', '34567890100102', 'Salvador', 'Centro', 'Rua da Liberdade', '31987654323'),
('Auto Parts Brasil', '45678901200103', 'Distrito Federal', 'Água Verde', 'Rua dos Trilhos', '41987654324'),
('Renova Peças', '56789012300104', 'Fortaleza', 'Centro', 'Rua Dr. José Frota', '85987654325'),
('Ferragens do Brasil', '67890123400105', 'Fortaleza', 'Pituba', 'Rua das Pedras', '71987654326'),
('Peças Baratas', '78901234500106', 'Porto Alegre', 'Cidade Baixa', 'Rua dos Açores', '51987654327');

# 
DESC Peças;
SELECT * from Peças;
INSERT INTO Peças (Nome_peça, Descriçao_peça, Preço_peça) VALUES
('Óleo de motor', 'Óleo para motor de veículos, 1 litro', 90.00), -- Troca de óleo
('Filtro de ar', 'Filtro de ar para motor', 60.00), -- Troca de filtro de ar
('Bateria', 'Bateria automotiva de 60Ah', 650.00), -- Troca de bateria
('Correia dentada', 'Correia dentada para motor de 1.0 a 1.8', 150.00), -- Troca de correia dentada
('Amortecedor', 'Amortecedor para suspensão dianteira', 180.00), -- Substituição de amortecedores
('Pastilha de freio', 'Pastilhas para freios dianteiros', 100.00), -- Troca de freio Unitário
('Óleo de direção hidráulica', 'Óleo para direção hidráulica', 90.00 ), -- Troca de óleo da direção hidráulica
('Fluido de arrefecimento', 'Fluido para arrefecimento do motor', 40.00), -- Troca de fluido de arrefecimento
('Pastilha de freio traseira', 'Pastilhas para freios traseiros', 120.00 ), -- Troca de pastilhas de freio traseiras
('Filtro de combustível', 'Filtro de combustível para motor', 50.00), -- Troca de filtro de combustível
('Óleo de transmissão', 'Óleo para a transmissão do veículo', 60.00), -- Troca de óleo da transmissão
('Lâmpada de farol', 'Lâmpada para farol de veículo', 50.00), -- Substituição de lâmpada Unitário
('Filtro de ar condicionado', 'Filtro de ar condicionado para automóveis', 100.00), -- Troca de ar condicionado
('Vela de ignição', 'Vela de ignição NGK', 70.00), -- Troca de vela de ignição
('Coxins de motor', 'Coxins de motor para redução de vibração', 100.00), -- Substituição de coxins de motor
('Vidro de porta', 'Vidro de porta automotiva', 300.00), -- Troca de vidros
('Película para vidro', 'Película para vidros automotivos', 150.00), -- Colocação ou troca de películas
('Motor novo', 'Motor automotivo novo para substituição', 5000.00), -- Troca de motor
('Caixa de marcha', 'Caixa de marcha automotiva', 3000.00), -- Troca da caixa de marcha
('Antena', 'Antena automotiva', 320.00), -- Troca da antena
('Tinta automotiva', 'Tinta para pintura de veículo', 80.00), -- Troca de pintura
('Pneu Aro 14', 'Pneu de alta performance para veículos compactos.', 150.00),
('Óleo Lubrificante', 'Óleo para motor de veículos, melhora o desempenho.', 70.00),
('Amortecedores', 'Amortecedores para veículos.', 940.00),
('Velas', 'Velas de ignição para carros, indispensáveis para o funcionamento do motor.', 25.00),
('Bateria 12V', 'Bateria de 12V para veículos de diversos modelos.', 180.00),
('Suspensao','suspensao de alta durabilidade',500.00),
('ar condicionado','ar condicionado completo para carro',600.00),
('direçao','direçao de alta resistencia',450.00);


DESC Ordemserviço_serviços_mecanicos;
SELECT * from Ordemserviço_serviços_mecanicos;
INSERT INTO Ordemserviço_serviços_mecanicos (Idordemserviço,Idserviço,Idmecanico) VALUES
(1, 3,5), (1, 4,1), (1, 7,8), (1, 11,4), (1, 13,2), (1, 19,14), (1, 20,14), (1, 23,14), (1, 23,14), (1, 23,14), (1, 24,18),
(2, 1,22), (2, 2,23), (2, 6,21), (2, 7,20), (2, 8,16), (2, 11,16), (2, 20,18),
(3, 1,17), (3, 10,3), (3, 18,1), (3, 25,18),
(4, 15,6), (4, 17,5), (4, 21,9), (4, 22,10),
(5, 1,23), (5, 3,5),
(6, 4,1), (6, 6,4), (6, 6,4), (6, 6,4), (6, 6,4), (6, 7,15), (6, 16,12), (6, 23,18), (6, 23,18), (6, 23,18),
(7, 15,6), (7, 18,1), (7, 20,8),
(8, 4,13), (8, 5,13), (8, 6,11), (8, 6,11), (8, 7,20), (8, 8,4), (8, 12,7), (8, 13,2), (8, 19,14), (8, 20,18),
(9, 23,10), (9, 23,10), (9, 23,10), (9, 23,10), (9, 25,10),
(10, 2,1), (10, 6,21), (10, 6,21), (10, 6,21), (10, 7,8), (10, 10,3), (10, 12,7), (10, 13,2), (10, 14,5), (10, 14,5), 
(10, 14,5), (10, 14,5), (10, 15,23), (10, 19,14), (10, 20,14), (10, 21,2), (10, 22,14), (10, 24,14);


DESC Ordemserviço_peças;
SELECT * from Ordemserviço_peças;
INSERT INTO Ordemserviço_peças (Idordemserviço,Idpeça) VALUES
(1,5), (1,4), (1, 9), (1, 11), (1, 16), (1, 17),(1, 21),
(2, 1), (2, 2), (2, 6), (2, 11), (2, 9), (2, 17),
(3, 1), (3, 27), (3, 15), (3, 21),
(4, 28), (4, 29), (4, 18), (4, 19),
(5, 1), (5, 3),
(6, 4), (6, 6), (6, 6), (6, 9), (6, 9), (6, 14),
(7, 28), (7, 15), (7, 17),
(8, 4), (8, 24), (8, 6), (8, 6), (8, 7), (8, 10), (8, 11), (8, 16), (8, 17),
(9, 21),
(10, 2), (10, 6), (10, 6), (10, 9), (10, 27), (10, 10), (10, 11), (10, 12), (10, 12), 
(10, 12), (10, 12), (10, 13), (10, 16), (10, 17), (10, 18), (10, 19), (10, 20);


DESC Estoque_peças;
SELECT * from Estoque_peças;
INSERT INTO Estoque_peças (Idpeça, Quantidade_estoque) VALUES
(1, 70),
(2, 35),
(3, 15),
(4, 40),
(5, 25),
(6, 30),
(7, 50),
(8, 50),
(9, 25),
(10, 19),
(11, 40),
(12, 50),
(13, 30),
(14, 50),
(15, 40),
(16, 30),
(17, 110),
(18, 10),
(19, 7),
(20, 18),
(21, 45),
(22, 10),
(23, 45),
(24, 29),
(25, 50),
(26, 10);


DESC Fornecedor_peças;
SELECT * from Fornecedor_peças;
INSERT INTO Fornecedor_peças (Idfornecedor, Idpeça, Quantidade_peças) VALUES
(5 ,1, 25),
(5, 2, 7),
(1, 3, 9),
(5,4, 6),
(2,5, 10),
(2,6, 23),
(2,7, 12),
(4,8, 5),
(5,9, 18),
(4,10, 12),
(3,11, 12),
(3,12, 19),
(6,13, 12),
(7,14, 25),
(7,15, 10),
(2,16, 20),
(2,17, 40),
(1,18, 3),
(6,19, 2),
(3,20, 6),
(5,21, 10),
(7,22, 12),
(3,23, 60),
(5,24, 9),
(6,25, 20),
(2,26, 9),
(5,22,9),
(6,26,2);

DESC Feedback;
SELECT * from Feedback;
INSERT INTO Feedback (Idordemserviço, Idcliente, Rating, Comentario, Data_feedback) VALUES
(1, 1, 5, 'Excelente serviço, tudo no prazo.', '2025-03-01 16:00:00'),
(2, 2, 5, 'Serviço bom.', '2025-03-01 16:30:00'),
(3, 3, 4, 'O serviço está ficando perfeito.', '2025-03-02 12:00:00'),
(4, 4, 5, 'Muito bom, preço justo e o carro ficou perfeito.', '2025-03-02 11:00:00'),
(5, 5, 4, 'Gostei do serviço, mas o prazo foi um pouco longo.', '2025-03-02 11:30:00'),
(6, 6, 5, 'Excelente atendimento, muito rápido e eficiente.', '2025-03-02 14:00:00'),
(7, 7, 3, 'O serviço foi razoável, mas poderia ter sido melhor.', '2025-03-03 09:30:00'),
(8, 8, 2, 'Infelizmente o serviço não atendeu às minhas expectativas.', '2025-03-04 13:45:00'),
(9, 9, 4, 'Bom serviço, mas a comunicação poderia ser mais clara.', '2025-03-04 10:00:00'),
(10, 10, 5, 'Espero que meu carro volte melhor do que antes!', '2025-03-04 16:30:00');

DESC Pagamentos;
SELECT * from Pagamentos;
INSERT INTO Pagamentos (Idordemserviço, Valor_pago, Forma_pagamento, Data_pagamento, Status_pagamento) VALUES
(1, 6970.00, 'cartão de credito', '2025-03-01 15:30:00', 'pendente'),
(2, 2980.00, 'dinheiro', '2025-03-03 16:00:00', 'pago'),
(3, 5830.00, 'transferencia bancaria', '2025-03-01 16:30:00', 'pendente'),
(4, 20480.00, 'cartão de debito', '2025-03-02 15:00:00', 'pendente'),
(5, 2360.00, 'dinheiro', '2025-03-12 11:00:00', 'pago'),
(6, 5400.00, 'cartão de credito', '2025-03-02 17:00:00', 'pendente'),
(7, 2040.00, 'transferencia bancaria', '2025-03-12 12:00:00', 'pago'),
(8, 7710.00, 'cartão de debito', '2025-03-03 09:00:00', 'pendente'),
(9, 4680.00, 'dinheiro', '2025-03-12 11:30:00', 'pago'),
(10, 31250.00, 'cartão de credito', '2025-03-03 10:00:00', 'pendente');


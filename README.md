# Modelo_Conceitual_Oficina
- [Modelo Inicial feito no Mysql](Modelo_EER_Oficina.mwb)
- [Modelo Finalizado feito no Mysql](Modelo_EER_Oficina_finalizado.mwb)
---
# Explicação do Banco de Dados
1. Tabela Cliente
    - Esta tabela armazena informações sobre os clientes da oficina. Cada cliente pode ter vários veículos, mas a tabela não possui relações diretas com outras tabelas além de sua chave primária Idcliente.
2. Tabela Veiculo
    - A tabela Veiculo armazena os dados dos veículos dos clientes. Cada veículo pertence a um cliente (relacionamento 1:N com a tabela Cliente), ou seja, um cliente pode ter vários veículos, mas cada veículo está associado a um único cliente.
    - Relacionamento: Idcliente (chave estrangeira) está relacionado com a tabela Cliente via Idcliente.
3. Tabela Ordemserviço
    - Esta tabela registra ordens de serviço geradas para o reparo ou manutenção dos veículos. Cada ordem de serviço está associada a um único veículo, e pode incluir múltiplos serviços e peças, conforme o caso.      - Relacionamento: Cada Ordemserviço está vinculada a um único Veiculo via Idveiculo (chave estrangeira). As ordens de serviço podem ter múltiplos pagamentos registrados na tabela Pagamentos e múltiplos feedbacks registrados na tabela Feedback.
4. Tabela Pagamentos
    - Armazena informações sobre os pagamentos realizados pelos clientes para uma ordem de serviço. Cada pagamento está associado a uma ordem de serviço específica, podendo ter um valor pago parcial ou total.
    - Relacionamento:A tabela Pagamentos está associada à tabela Ordemserviço via Idordemserviço (chave estrangeira). Uma ordem de serviço pode ter múltiplos pagamentos (ex.: pagamentos parcelados ou adicionais).
5. Tabela Feedback
    - Aqui são armazenados os feedbacks dos clientes sobre os serviços prestados pela oficina. Cada feedback é dado por um cliente para uma ordem de serviço específica, permitindo que a oficina colete avaliações e comentários dos serviços prestados.
    - Relacionamento: A tabela Feedback está associada à tabela Ordemserviço via Idordemserviço (chave estrangeira). A tabela Feedback também está associada à tabela Cliente via Idcliente (chave estrangeira), garantindo que o feedback é dado pelo cliente correto.
6. Tabela Serviços
    - Esta tabela armazena os tipos de serviços oferecidos pela oficina. Cada serviço pode ser relacionado a várias ordens de serviço (realizado em diferentes veículos). A tabela define o nome, a descrição e o preço de cada serviço.
    - Relacionamento: A tabela Serviços é relacionada à tabela Ordemserviço_serviços_mecanicos através do Idserviço, que serve para associar os serviços com as ordens de serviço e mecânicos.
7. Tabela Ordemserviço_serviços_mecanicos
    - Esta tabela faz o relacionamento entre a ordem de serviço, os serviços executados e os mecânicos responsáveis por cada serviço. Uma ordem de serviço pode ter vários serviços realizados por mecânicos diferentes, e essa tabela facilita a associação entre esses elementos.
    - Relacionamento: A tabela Ordemserviço_serviços_mecanicos tem chaves estrangeiras associando Idordemserviço (da tabela Ordemserviço), Idserviço (da tabela Serviços) e Idmecanico (da tabela Mecanicos). Essa tabela estabelece uma relação N:M entre ordens de serviço, serviços e mecânicos.
8. Tabela Mecanicos
    - A tabela Mecanicos armazena informações sobre os mecânicos da oficina, incluindo suas especialidades e salários. Cada mecânico pode ser responsável por realizar múltiplos serviços, para não ter atrasos e mecanicos não ficarem parados.
    - Relacionamento: A tabela Mecanicos é associada à tabela Ordemserviço_serviços_mecanicos via Idmecanico (chave primária), que vincula o mecânico aos serviços realizados.
9. Tabela Peças
    - Armazena os produtos e peças utilizados na oficina. Essas peças podem ser de reposição ou produtos de consumo, como óleos, filtros, etc.
    - Relacionamento: A tabela Peças se relaciona com a tabela Ordemserviço_peças, que vincula as peças a ordens de serviço específicas. A tabela Fornecedor_peças faz o relacionamento entre fornecedores e as peças fornecidas.
10. Tabela Estoque_peças
    - Esta tabela é responsável pelo controle do estoque de peças na oficina. Cada peça pode ter uma quantidade disponível em estoque, e essa tabela registra a quantidade disponível de cada peça.
    - Relacionamento: A tabela Estoque_peças tem uma chave estrangeira Idpeça que faz referencia à tabela Peças, relacionando a quantidade disponivel com as peças especificas.
11. Tabela Ordemserviço_peças
    - A tabela Ordemserviço_peças faz a ligação entre as ordens de serviço e as peças que foram usadas ou necessárias para o serviço. Ela permite que a oficina registre quais peças foram utilizadas em uma ordem de serviço específica.
    - Relacionamento: A tabela Ordemserviço_peças faz referência à tabela Ordemserviço via Idordemserviço e à tabela Peças via Idpeça.
12. Tabela Fornecedores
    - Armazena as informações sobre os fornecedores das peças da oficina. A oficina compra peças de diferentes fornecedores, e essa tabela contém os dados de cada fornecedor (nome, CNPJ, etc.).
    - Relacionamento: A tabela Fornecedores está associada à tabela Fornecedor_peças, que relaciona fornecedores a peças específicas.
13. Tabela Fornecedor_peças
    - Esta tabela faz o relacionamento entre os fornecedores e as peças que fornecem. Ela também inclui a quantidade de peças fornecidas por cada fornecedor.
    - Relacionamento: A tabela Fornecedor_peças faz referência à tabela Fornecedores e à tabela Peças com chaves estrangeiras, permitindo identificar quais peças cada fornecedor fornece.

## Relacionamentos das Tabelas
- 1:N (Um para Muitos):
    - Cliente → Veiculo: Um cliente pode ter vários veículos.
    - Veiculo → Ordemserviço: Um veículo pode ter várias ordens de serviço.
    - Ordemserviço → Pagamentos: Uma ordem de serviço pode ter vários pagamentos.
    - Ordemserviço → Feedback: Cada ordem de serviço pode ter um feedback único de um cliente.

- N:M (Muitos para Muitos):
    - Ordemserviço ↔ Serviços: Uma ordem de serviço pode ter múltiplos serviços e um serviço pode ser realizado em várias ordens de serviço (via Ordemserviço_serviços_mecanicos).
    - Ordemserviço ↔ Peças: Uma ordem de serviço pode ter várias peças associadas a ela e uma peça pode ser usada em várias ordens de serviço (via Ordemserviço_peças).
    - Mecanicos ↔ Serviços: Um mecânico pode realizar vários serviços e um serviço pode ser realizado por vários mecânicos (via Ordemserviço_serviços_mecanicos).
    - Fornecedor ↔ Peças: Um fornecedor pode fornecer várias peças e uma peça pode ser fornecida por vários fornecedores (via Fornecedor_peças).

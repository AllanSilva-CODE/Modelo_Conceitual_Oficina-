# Criando o banco de dados em sql _ Tema "Oficina"
CREATE DATABASE Oficina;
Show DATABASES;
USE Oficina;

show tables;

# tabela de clientes 
CREATE TABLE Cliente (
    Idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Date_of_birth DATE NOT Null,
    Phone CHAR(11) NOT NULL
);
ALTER TABLE Cliente AUTO_INCREMENT=1; # para a inserçao dos dados nao dá erro

# tabela do Veiculo
CREATE TABLE Veiculo (
    Idveiculo INT AUTO_INCREMENT PRIMARY KEY,
	Model VARCHAR(50) NOT NULL,
    Plate VARCHAR(10) NOT NULL,
    Mark VARCHAR(15) NOT NULL,
    Color VARCHAR(35) NOT NULL,
    Year_veiculo YEAR NOT NULL,
    Idcliente INT NOT NULL,
    FOREIGN KEY (Idcliente) REFERENCES Cliente(Idcliente)
);
alter TABLE Veiculo AUTO_INCREMENT=1;

# tabela Ordem de serviço
# Nos atributos Status_serviço e Data_conclusao, faz um alter table para mudar os dados
# se a qtd de peça estiver nula mas o serviço,foi concluido é porque o cliente trouxe o seu proprio produto/peça
# mas serviço nao pode ficar nulo, o cliente pode comprar produto/peça na loja da oficina 
 
CREATE TABLE Ordemserviço (
    Idordemserviço INT AUTO_INCREMENT PRIMARY KEY,
    Data_emissao DATETIME NOT NULL,
    Status_serviço ENUM('em andamento','concluído','cancelado') NOT NULL,
    Quantidade_serviço INT NOT NULL,
    Total_serviço DECIMAL(10,2) NOT NULL,
    Quantidade_peça INT,
    Total_peça DECIMAL(10,2),
    Valor_total DECIMAL(10,2) NOT NULL, # valor total do serviço
	Data_conclusao DATETIME, # pode ser nulo
    Idveiculo INT,
    FOREIGN KEY (Idveiculo) REFERENCES Veiculo(Idveiculo) ON DELETE CASCADE
);
alter TABLE Ordemserviço AUTO_INCREMENT=1;

# Tabela Pagamentos (armazena os dados de pagamento do cliente)
CREATE TABLE Pagamentos (
    Idpagamento INT AUTO_INCREMENT PRIMARY KEY,
    Idordemserviço INT NOT NULL,
    Valor_pago DECIMAL(10,2) NOT NULL,
    Forma_pagamento ENUM('dinheiro', 'cartão de credito', 'cartão de debito', 'transferencia bancaria') NOT NULL,
    Data_pagamento DATETIME NOT NULL,
    Status_pagamento ENUM('pago', 'pendente', 'parcelado') NOT NULL,
    FOREIGN KEY (Idordemserviço) REFERENCES Ordemserviço(Idordemserviço) ON DELETE CASCADE
);
ALTER TABLE Pagamentos AUTO_INCREMENT=1;
 
# Tabela Feedback (armazena a nota do cliente pelo serviço)
CREATE TABLE Feedback (
    Idfeedback INT AUTO_INCREMENT PRIMARY KEY,
    Idordemserviço INT NOT NULL,
    Idcliente INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comentario VARCHAR(255) DEFAULT 'sem comentario',
    Data_feedback DATETIME NOT NULL,
    FOREIGN KEY (Idordemserviço) REFERENCES Ordemserviço(Idordemserviço) ON DELETE CASCADE,
    FOREIGN KEY (Idcliente) REFERENCES Cliente(Idcliente) ON DELETE CASCADE
);
ALTER TABLE Feedback AUTO_INCREMENT=1;

# tabela de serviços da oficina
# Aqui está um exemplo de como os dados podem ser preenchidos:
#Um cliente leva o carro à oficina, e um problema é registrado na Ordem de Serviço:
#Problema: "O carro não liga, o motor está fazendo barulho".
#O mecânico faz uma análise e associa os serviços necessários à ordem de serviço:
#Serviço 1: "Verificação de sistema de ignição"
#Serviço 2: "Troca de velas"
#Serviço 3: "Verificação do motor"
#ex (liga o idordem de serviço com o idserviço)(uma ordem pode ter varios serviços)
# tabela Serviços
CREATE TABLE Serviços (
    Idserviço INT AUTO_INCREMENT PRIMARY KEY,
    Serviço VARCHAR(100) NOT NULL UNIQUE,
    Descriçao_serviço VARCHAR(255) DEFAULT 'sem descriçao',
    Preço_serviço DECIMAL(10,2) NOT NULL
);
alter TABLE Serviços AUTO_INCREMENT=1;

# Tabela Ordemserviço_serviço_mecanico
CREATE TABLE Ordemserviço_serviços_mecanicos (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    Idordemserviço INT,
    Idserviço INT,
    Idmecanico INT,  
    FOREIGN KEY (Idordemserviço) REFERENCES Ordemserviço(Idordemserviço) ON DELETE CASCADE,
    FOREIGN KEY (Idserviço) REFERENCES Serviços(Idserviço) ON DELETE CASCADE,
    FOREIGN KEY (Idmecanico) REFERENCES Mecanicos(Idmecanico) ON DELETE CASCADE
);

# tabela Mecanicos
#especialidades
#'motor', 'transmissao', 'suspensao', 'freios', 'eletrico', 'ar condicionado', 
#'injeçao eletronica', 'alinhamento e balaceamento','vidro e carroceria','pneu'
CREATE TABLE Mecanicos(
    Idmecanico INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    Especialidade ENUM('motor', 'transmissao', 'suspensao', 'freios', 'eletrico', 'ar condicionado', 'injeçao eletronica', 'alinhamento e balaceamento','vidro e carroceria','pneu') NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Date_of_birth DATE NOT NUll,
    Phone CHAR(11) NOT NULL
);
alter TABLE Mecanicos AUTO_INCREMENT=1;

# tabela Peças tambem pode ser produtos(tipo-'oleo','agua desmineralizada','pneu'
CREATE TABLE Peças (
    idpeça INT AUTO_INCREMENT PRIMARY KEY,
    Nome_peça VARCHAR(100) NOT NULL UNIQUE,
    Descriçao_peça VARCHAR(200) DEFAULT 'sem descriçao',
    Preço_peça DECIMAL(10,2) NOT NULL
);
alter TABLE Peças AUTO_INCREMENT=1;

# Tabela Estoque de peças (controlar a quantidade disponível de cada peça)
CREATE TABLE Estoque_peças (
    Idpeça INT,
    Quantidade_estoque INT NOT NULL,
    PRIMARY KEY (Idpeça),
    FOREIGN KEY (Idpeça) REFERENCES Peças(Idpeça) ON DELETE CASCADE
);

# tabela Ordemserviço_peças
# se a qtd de peça estiver nula mas o serviço,foi concluido é porque o cliente trouxe o seu proprio produto
CREATE TABLE Ordemserviço_peças ( 
    id INT AUTO_INCREMENT PRIMARY KEY,  
    Idordemserviço INT,
    Idpeça INT,
    FOREIGN KEY (Idordemserviço) REFERENCES Ordemserviço(Idordemserviço) ON DELETE CASCADE,
    FOREIGN KEY (Idpeça) REFERENCES Peças(Idpeça) ON DELETE CASCADE
);

# tabela fornecedor
CREATE TABLE Fornecedores (
    Idfornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_fornecedor VARCHAR(50) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Phone CHAR(11) NOT NULL
);
alter TABLE Fornecedores AUTO_INCREMENT=1;

# Tabela Fornecedor_peças (relacionamento entre fornecedor e peças)
CREATE TABLE Fornecedor_peças (
    Idfornecedor INT,
    Idpeça INT,
    quantidade_peças INT NOT NULL,
    PRIMARY KEY (Idfornecedor, Idpeça),
    FOREIGN KEY (Idfornecedor) REFERENCES Fornecedores(Idfornecedor) ON DELETE CASCADE,
    FOREIGN KEY (Idpeça) REFERENCES Peças(idpeça) ON DELETE CASCADE
);

# Objetivo da Trigger:Quando o status do serviço for alterado para "concluído", e se o campo Quantidade_peça for nulo, a trigger pode:
# Definir a Quantidade_peça como 0, Garantindo que não haja inconsistência de dados na tabela.
DELIMITER //
CREATE TRIGGER Atualizar_Quantidade_peca
BEFORE UPDATE ON Ordemserviço
FOR EACH ROW
BEGIN
    # Verificar se o Status do serviço foi alterado para 'concluído' e se a Quantidade_peça é nula
    IF NEW.Status_serviço = 'concluído' AND NEW.Quantidade_peça IS NULL THEN
        # Se a quantidade de peças for nula, configurar o valor como 0 
        SET NEW.Quantidade_peça = 0;
    END IF;
END //
DELIMITER ;

# para usar o trigger
# UPDATE Ordem_serviço
# SET Status_serviço = 'concluído', Quantidade_peça = NULL
# WHERE Idordem_serviço = 1;

-- Cria o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS Hospital_BD;
-- Usa o banco de dados Hospital_BD
USE Hospital_BD;

-- Exclui tabelas se existirem
DROP TABLE IF EXISTS Visita, Internacao, Consulta, Agendamento, Funcionario_Recepcao, Atendimento, Unidade_Internacao, Medico, Paciente;

-- Criação das tabelas com engine InnoDB para FK
CREATE TABLE Paciente (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    sexo ENUM('M', 'F', 'Outro'),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    convenio VARCHAR(100)
); 

CREATE TABLE Medico (
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Unidade_Internacao (
    unidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_unidade VARCHAR(100)
) ;

CREATE TABLE Atendimento (
    atendimento_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data DATETIME,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
) ;

CREATE TABLE Funcionario_Recepcao (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    atendimento_id INT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    FOREIGN KEY (atendimento_id) REFERENCES Atendimento(atendimento_id)
) ;

CREATE TABLE Agendamento (
    agendamento_id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT,
    paciente_id INT,
    data_agendamento DATETIME,
    tipo_consulta VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario_Recepcao(funcionario_id),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
) ;

CREATE TABLE Consulta (
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    medico_id INT,
    paciente_id INT,
    data DATETIME,
    diagnostico TEXT,
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
) ;

CREATE TABLE Internacao (
    internacao_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    unidade_id INT,
    medico_id INT,
    motivo_internacao VARCHAR(255),
    data_admissao DATE,
    data_saida DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (unidade_id) REFERENCES Unidade_Internacao(unidade_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id)
) ;

CREATE TABLE Visita (
    visita_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data_visita DATE,
    nome_visitante VARCHAR(100),
    relacionamento_visitante VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
) ;


-- Inserção dos dados

INSERT INTO Paciente (nome, cpf, data_nascimento, sexo, telefone, endereco, convenio) VALUES
('Ana Paula', '111.111.111-01', '1980-01-10', 'F', '(11) 90000-0001', 'Rua 1, 10', 'Unimed'),
('Bruno Costa', '111.111.111-02', '1975-05-20', 'M', '(11) 90000-0002', 'Rua 2, 20', 'Bradesco Saúde'),
('Carla Lima', '111.111.111-03', '1995-07-30', 'F', '(11) 90000-0003', 'Rua 3, 30', 'Amil'),
('Diego Santos', '111.111.111-04', '1988-12-15', 'M', '(11) 90000-0004', 'Rua 4, 40', 'Unimed'),
('Elisa Rocha', '111.111.111-05', '1992-11-11', 'F', '(11) 90000-0005', 'Rua 5, 50', 'Bradesco Saúde'),
('Fábio Martins', '111.111.111-06', '1979-09-09', 'M', '(11) 90000-0006', 'Rua 6, 60', 'Amil'),
('Gabriela Souza', '111.111.111-07', '1983-06-06', 'F', '(11) 90000-0007', 'Rua 7, 70', 'Unimed'),
('Hugo Alves', '111.111.111-08', '1990-03-03', 'M', '(11) 90000-0008', 'Rua 8, 80', 'Bradesco Saúde'),
('Isabela Ferreira', '111.111.111-09', '1997-02-02', 'F', '(11) 90000-0009', 'Rua 9, 90', 'Amil'),
('João Pedro', '111.111.111-10', '1985-01-01', 'M', '(11) 90000-0010', 'Rua 10, 100', 'Unimed'),
('Karen Dias', '111.111.111-11', '1991-08-08', 'F', '(11) 90000-0011', 'Rua 11, 110', 'Bradesco Saúde'),
('Lucas Pereira', '111.111.111-12', '1984-04-04', 'M', '(11) 90000-0012', 'Rua 12, 120', 'Amil'),
('Mariana Rocha', '111.111.111-13', '1993-12-12', 'F', '(11) 90000-0013', 'Rua 13, 130', 'Unimed'),
('Natan Silva', '111.111.111-14', '1982-07-07', 'M', '(11) 90000-0014', 'Rua 14, 140', 'Bradesco Saúde'),
('Olivia Costa', '111.111.111-15', '1996-09-09', 'F', '(11) 90000-0015', 'Rua 15, 150', 'Amil'),
('Paulo Gomes', '111.111.111-16', '1989-10-10', 'M', '(11) 90000-0016', 'Rua 16, 160', 'Unimed'),
('Quésia Lima', '111.111.111-17', '1994-05-05', 'F', '(11) 90000-0017', 'Rua 17, 170', 'Bradesco Saúde'),
('Ricardo Fernandes', '111.111.111-18', '1981-11-11', 'M', '(11) 90000-0018', 'Rua 18, 180', 'Amil'),
('Sofia Ribeiro', '111.111.111-19', '1998-08-08', 'F', '(11) 90000-0019', 'Rua 19, 190', 'Unimed'),
('Tiago Martins', '111.111.111-20', '1987-06-06', 'M', '(11) 90000-0020', 'Rua 20, 200', 'Bradesco Saúde'),
('Úrsula Dias', '111.111.111-21', '1999-03-03', 'F', '(11) 90000-0021', 'Rua 21, 210', 'Amil'),
('Victor Souza', '111.111.111-22', '1986-12-12', 'M', '(11) 90000-0022', 'Rua 22, 220', 'Unimed'),
('Waleska Alves', '111.111.111-23', '1992-01-01', 'F', '(11) 90000-0023', 'Rua 23, 230', 'Bradesco Saúde'),
('Xavier Gomes', '111.111.111-24', '1983-04-04', 'M', '(11) 90000-0024', 'Rua 24, 240', 'Amil'),
('Yara Rocha', '111.111.111-25', '1990-07-07', 'F', '(11) 90000-0025', 'Rua 25, 250', 'Unimed'),
('Zeca Silva', '111.111.111-26', '1985-10-10', 'M', '(11) 90000-0026', 'Rua 26, 260', 'Bradesco Saúde'),
('Alice Pereira', '111.111.111-27', '1997-03-03', 'F', '(11) 90000-0027', 'Rua 27, 270', 'Amil'),
('Bruno Dias', '111.111.111-28', '1980-12-12', 'M', '(11) 90000-0028', 'Rua 28, 280', 'Unimed'),
('Camila Costa', '111.111.111-29', '1994-01-01', 'F', '(11) 90000-0029', 'Rua 29, 290', 'Bradesco Saúde'),
('Daniel Gomes', '111.111.111-30', '1982-09-09', 'M', '(11) 90000-0030', 'Rua 30, 300', 'Amil'),
('Elaine Ribeiro', '111.111.111-31', '1993-11-11', 'F', '(11) 90000-0031', 'Rua 31, 310', 'Unimed'),
('Fábio Martins', '111.111.111-32', '1981-07-07', 'M', '(11) 90000-0032', 'Rua 32, 320', 'Bradesco Saúde'),
('Giovana Lima', '111.111.111-33', '1998-06-06', 'F', '(11) 90000-0033', 'Rua 33, 330', 'Amil'),
('Heitor Silva', '111.111.111-34', '1987-03-03', 'M', '(11) 90000-0034', 'Rua 34, 340', 'Unimed'),
('Isabela Fernandes', '111.111.111-35', '1992-10-10', 'F', '(11) 90000-0035', 'Rua 35, 350', 'Bradesco Saúde'),
('João Souza', '111.111.111-36', '1984-08-08', 'M', '(11) 90000-0036', 'Rua 36, 360', 'Amil'),
('Kátia Ribeiro', '111.111.111-37', '1995-05-05', 'F', '(11) 90000-0037', 'Rua 37, 370', 'Unimed'),
('Leandro Alves', '111.111.111-38', '1989-02-02', 'M', '(11) 90000-0038', 'Rua 38, 380', 'Bradesco Saúde'),
('Marina Dias', '111.111.111-39', '1996-04-04', 'F', '(11) 90000-0039', 'Rua 39, 390', 'Amil'),
('Nicolas Gomes', '111.111.111-40', '1983-01-01', 'M', '(11) 90000-0040', 'Rua 40, 400', 'Unimed'),
('Olga Rocha', '111.111.111-41', '1990-09-09', 'F', '(11) 90000-0041', 'Rua 41, 410', 'Bradesco Saúde'),
('Paulo Silva', '111.111.111-42', '1986-06-06', 'M', '(11) 90000-0042', 'Rua 42, 420', 'Amil'),
('Queila Pereira', '111.111.111-43', '1994-12-12', 'F', '(11) 90000-0043', 'Rua 43, 430', 'Unimed'),
('Rafael Costa', '111.111.111-44', '1981-03-03', 'M', '(11) 90000-0044', 'Rua 44, 440', 'Bradesco Saúde');

INSERT INTO Medico (nome, especialidade) VALUES
('Dr. André Lima', 'Cardiologista'),
('Dra. Beatriz Sousa', 'Neurologista'),
('Dr. Caio Ferreira', 'Ortopedista'),
('Dra. Daniela Rocha', 'Pediatra'),
('Dr. Eduardo Silva', 'Dermatologista'),
('Dra. Fernanda Alves', 'Ginecologista'),
('Dr. Gustavo Santos', 'Endocrinologista'),
('Dra. Helena Dias', 'Psiquiatra'),
('Dr. Igor Gomes', 'Oftalmologista'),
('Dra. Juliana Pereira', 'Reumatologista'),
('Dr. Kleber Matos', 'Urologista'),
('Dra. Larissa Oliveira', 'Oncologista'),
('Dr. Marcelo Andrade', 'Infectologista'),
('Dra. Natália Castro', 'Pneumologista'),
('Dr. Otávio Moreira', 'Cardiologista'),
('Dra. Patrícia Lima', 'Neurologista'),
('Dr. Rafael Barros', 'Ortopedista'),
('Dra. Sandra Fernandes', 'Pediatra'),
('Dr. Tiago Santos', 'Dermatologista'),
('Dra. Vanessa Ribeiro', 'Ginecologista'),
('Dr. Wagner Costa', 'Endocrinologista'),
('Dra. Yasmin Martins', 'Psiquiatra'),
('Dr. Zeca Dias', 'Oftalmologista'),
('Dra. Alice Rocha', 'Reumatologista'),
('Dr. Bruno Almeida', 'Urologista'),
('Dra. Carla Pires', 'Oncologista'),
('Dr. Daniel Souza', 'Infectologista'),
('Dra. Elisa Fernandes', 'Pneumologista'),
('Dr. Felipe Campos', 'Cardiologista'),
('Dra. Glória Matos', 'Neurologista'),
('Dr. Henrique Oliveira', 'Ortopedista'),
('Dra. Isabela Ferreira', 'Pediatra'),
('Dr. João Pedro Lima', 'Dermatologista'),
('Dra. Karina Santos', 'Ginecologista'),
('Dr. Lucas Silva', 'Endocrinologista'),
('Dra. Mariana Alves', 'Psiquiatra'),
('Dr. Nelson Gomes', 'Oftalmologista'),
('Dra. Olivia Pereira', 'Reumatologista'),
('Dr. Paulo Costa', 'Urologista'),
('Dra. Quésia Dias', 'Oncologista'),
('Dr. Rodrigo Barros', 'Infectologista'),
('Dra. Sabrina Rocha', 'Pneumologista'),
('Dr. Thiago Martins', 'Cardiologista'),
('Dra. Ubiraci Fernandes', 'Neurologista'),
('Dr. Vinícius Almeida', 'Ortopedista'),
('Dra. Wagneria Souza', 'Pediatra'),
('Dr. Xavier Lima', 'Dermatologista'),
('Dra. Yara Oliveira', 'Ginecologista'),
('Dr. Zilda Santos', 'Endocrinologista'),
('Dra. Alexandre Costa', 'Psiquiatra'),
('Dr. Bianca Martins', 'Oftalmologista'),
('Dra. Carlos Ferreira', 'Reumatologista'),
('Dr. Débora Rocha', 'Urologista'),
('Dra. Everton Souza', 'Oncologista'),
('Dr. Fabiana Dias', 'Infectologista'),
('Dra. Gilberto Alves', 'Pneumologista'),
('Dr. Heloísa Matos', 'Cardiologista'),
('Dra. Ismael Pereira', 'Neurologista'),
('Dr. Juliana Lima', 'Ortopedista'),
('Dra. Kleber Souza', 'Pediatra'),
('Dr. Lúcia Fernandes', 'Dermatologista'),
('Dra. Maurício Dias', 'Ginecologista');


INSERT INTO Unidade_Internacao (nome_unidade) VALUES
('Unidade A - Cardiologia'),
('Unidade B - Neurologia'),
('Unidade C - Ortopedia'),
('Unidade D - Pediatria'),
('Unidade E - Dermatologia'),
('Unidade F - Ginecologia'),
('Unidade G - Endocrinologia'),
('Unidade H - Psiquiatria'),
('Unidade I - Oftalmologia'),
('Unidade J - Reumatologia'),
('Unidade K - Urologia'),
('Unidade L - Oncologia'),
('Unidade M - Infectologia'),
('Unidade N - Pneumologia'),
('Unidade O - Emergência'),
('Unidade P - Cuidados Intensivos'),
('Unidade Q - Cirurgia Geral'),
('Unidade R - Neonatologia'),
('Unidade S - Fisioterapia'),
('Unidade T - Hematologia'),
('Unidade U - Gastroenterologia'),
('Unidade V - Nefrologia'),
('Unidade W - Endoscopia'),
('Unidade X - Radiologia'),
('Unidade Y - Anestesiologia'),
('Unidade Z - Otorrinolaringologia'),
('Unidade AA - Dermatologia Pediátrica'),
('Unidade AB - Psicologia'),
('Unidade AC - Reabilitação'),
('Unidade AD - Terapia Intensiva'),
('Unidade AE - Medicina Interna'),
('Unidade AF - Traumatologia'),
('Unidade AG - Transplantes'),
('Unidade AH - Clínica Médica'),
('Unidade AI - Unidade de Dor'),
('Unidade AJ - Medicina Nuclear'),
('Unidade AK - Cirurgia Plástica'),
('Unidade AL - Endocrinologia Pediátrica'),
('Unidade AM - Unidade de Queimados'),
('Unidade AN - Unidade de AVC'),
('Unidade AO - Unidade de Insuficiência Renal'),
('Unidade AP - Unidade de Diálise'),
('Unidade AQ - Unidade de Cardiologia Pediátrica'),
('Unidade AR - Unidade de Oncologia Pediátrica'),
('Unidade AS - Unidade de Cuidados Paliativos'),
('Unidade AT - Unidade de Infectologia Pediátrica'),
('Unidade AU - Unidade de Reumatologia Pediátrica'),
('Unidade AV - Unidade de Neurologia Pediátrica'),
('Unidade AW - Unidade de Emergência Pediátrica'),
('Unidade AX - Unidade de Psiquiatria Pediátrica'),
('Unidade AY - Unidade de Terapia Intensiva Pediátrica'),
('Unidade AZ - Unidade de Cirurgia Pediátrica'),
('Unidade BA - Unidade de Hematologia Pediátrica'),
('Unidade BB - Unidade de Gastroenterologia Pediátrica'),
('Unidade BC - Unidade de Nefrologia Pediátrica'),
('Unidade BD - Unidade de Radiologia Pediátrica'),
('Unidade BE - Unidade de Anestesiologia Pediátrica'),
('Unidade BF - Unidade de Otorrinolaringologia Pediátrica');


INSERT INTO Atendimento (paciente_id, data, motivo) VALUES
(1, '2025-06-15 08:30:00', 'Consulta geral'),
(2, '2025-06-15 09:00:00', 'Exame cardiológico'),
(3, '2025-06-15 09:30:00', 'Dor nas costas'),
(4, '2025-06-15 10:00:00', 'Consulta pediátrica'),
(5, '2025-06-15 10:30:00', 'Avaliação dermatológica'),
(6, '2025-06-15 11:00:00', 'Consulta ginecológica'),
(7, '2025-06-15 11:30:00', 'Avaliação hormonal'),
(8, '2025-06-15 12:00:00', 'Consulta psiquiátrica'),
(9, '2025-06-15 12:30:00', 'Avaliação oftalmológica'),
(10, '2025-06-15 13:00:00', 'Consulta reumatológica'),
(11, '2025-06-16 08:30:00', 'Avaliação urológica'),
(12, '2025-06-16 09:00:00', 'Consulta oncológica'),
(13, '2025-06-16 09:30:00', 'Avaliação infectológica'),
(14, '2025-06-16 10:00:00', 'Consulta pneumológica'),
(15, '2025-06-16 10:30:00', 'Atendimento emergencial'),
(16, '2025-06-16 11:00:00', 'Consulta de rotina'),
(17, '2025-06-16 11:30:00', 'Consulta cirúrgica'),
(18, '2025-06-16 12:00:00', 'Consulta neonatológica'),
(19, '2025-06-16 12:30:00', 'Avaliação fisioterápica'),
(20, '2025-06-16 13:00:00', 'Consulta hematológica'),
(21, '2025-06-17 08:30:00', 'Consulta gastroenterológica'),
(22, '2025-06-17 09:00:00', 'Avaliação nefrológica'),
(23, '2025-06-17 09:30:00', 'Consulta endoscópica');


INSERT INTO Funcionario_Recepcao (atendimento_id, nome, cargo, cpf, telefone) VALUES
(1, 'Ana Paula', 'Recepcionista', '222.333.444-01', '(11) 90001-0001'),
(2, 'Bruno Costa', 'Recepcionista', '222.333.444-02', '(11) 90001-0002'),
(3, 'Carla Lima', 'Recepcionista', '222.333.444-03', '(11) 90001-0003'),
(4, 'Diego Santos', 'Recepcionista', '222.333.444-04', '(11) 90001-0004'),
(5, 'Elisa Rocha', 'Recepcionista', '222.333.444-05', '(11) 90001-0005'),
(6, 'Fábio Martins', 'Recepcionista', '222.333.444-06', '(11) 90001-0006'),
(7, 'Gabriela Souza', 'Recepcionista', '222.333.444-07', '(11) 90001-0007'),
(8, 'Hugo Alves', 'Recepcionista', '222.333.444-08', '(11) 90001-0008'),
(9, 'Isabela Ferreira', 'Recepcionista', '222.333.444-09', '(11) 90001-0009'),
(10, 'João Pedro', 'Recepcionista', '222.333.444-10', '(11) 90001-0010'),
(11, 'Karen Dias', 'Recepcionista', '222.333.444-11', '(11) 90001-0011'),
(12, 'Lucas Pereira', 'Recepcionista', '222.333.444-12', '(11) 90001-0012'),
(13, 'Mariana Rocha', 'Recepcionista', '222.333.444-13', '(11) 90001-0013'),
(14, 'Natan Silva', 'Recepcionista', '222.333.444-14', '(11) 90001-0014'),
(15, 'Olivia Costa', 'Recepcionista', '222.333.444-15', '(11) 90001-0015'),
(16, 'Paulo Gomes', 'Recepcionista', '222.333.444-16', '(11) 90001-0016'),
(17, 'Quésia Lima', 'Recepcionista', '222.333.444-17', '(11) 90001-0017'),
(18, 'Ricardo Fernandes', 'Recepcionista', '222.333.444-18', '(11) 90001-0018'),
(19, 'Sofia Ribeiro', 'Recepcionista', '222.333.444-19', '(11) 90001-0019'),
(20, 'Tiago Martins', 'Recepcionista', '222.333.444-20', '(11) 90001-0020'),
(21, 'Úrsula Dias', 'Recepcionista', '222.333.444-21', '(11) 90001-0021'),
(22, 'Victor Souza', 'Recepcionista', '222.333.444-22', '(11) 90001-0022'),
(23, 'Waleska Alves', 'Recepcionista', '222.333.444-23', '(11) 90001-0023'),
(24, 'Xavier Gomes', 'Recepcionista', '222.333.444-24', '(11) 90001-0024'),
(25, 'Yara Rocha', 'Recepcionista', '222.333.444-25', '(11) 90001-0025'),
(26, 'Zeca Silva', 'Recepcionista', '222.333.444-26', '(11) 90001-0026'),
(27, 'Alice Pereira', 'Recepcionista', '222.333.444-27', '(11) 90001-0027'),
(28, 'Bruno Dias', 'Recepcionista', '222.333.444-28', '(11) 90001-0028'),
(29, 'Camila Costa', 'Recepcionista', '222.333.444-29', '(11) 90001-0029'),
(30, 'Daniel Gomes', 'Recepcionista', '222.333.444-30', '(11) 90001-0030'),
(31, 'Elaine Ribeiro', 'Recepcionista', '222.333.444-31', '(11) 90001-0031'),
(32, 'Fábio Martins', 'Recepcionista', '222.333.444-32', '(11) 90001-0032'),
(33, 'Giovana Lima', 'Recepcionista', '222.333.444-33', '(11) 90001-0033'),
(34, 'Heitor Silva', 'Recepcionista', '222.333.444-34', '(11) 90001-0034'),
(35, 'Isabela Fernandes', 'Recepcionista', '222.333.444-35', '(11) 90001-0035'),
(36, 'João Souza', 'Recepcionista', '222.333.444-36', '(11) 90001-0036'),
(37, 'Kátia Ribeiro', 'Recepcionista', '222.333.444-37', '(11) 90001-0037'),
(38, 'Leandro Alves', 'Recepcionista', '222.333.444-38', '(11) 90001-0038'),
(39, 'Marina Dias', 'Recepcionista', '222.333.444-39', '(11) 90001-0039'),
(40, 'Nicolas Gomes', 'Recepcionista', '222.333.444-40', '(11) 90001-0040'),
(41, 'Olga Rocha', 'Recepcionista', '222.333.444-41', '(11) 90001-0041'),
(42, 'Paulo Silva', 'Recepcionista', '222.333.444-42', '(11) 90001-0042'),
(43, 'Queila Pereira', 'Recepcionista', '222.333.444-43', '(11) 90001-0043'),
(44, 'Rafael Costa', 'Recepcionista', '222.333.444-44', '(11) 90001-0044'),
(45, 'Sílvia Martins', 'Recepcionista', '222.333.444-45', '(11) 90001-0045'),
(46, 'Thiago Lima', 'Recepcionista', '222.333.444-46', '(11) 90001-0046'),
(47, 'Ulisses Souza', 'Recepcionista', '222.333.444-47', '(11) 90001-0047'),
(48, 'Vanessa Dias', 'Recepcionista', '222.333.444-48', '(11) 90001-0048'),
(49, 'Washington Alves', 'Recepcionista', '222.333.444-49', '(11) 90001-0049'),
(50, 'Xênia Gomes', 'Recepcionista', '222.333.444-50', '(11) 90001-0050'),
(51, 'Yuri Rocha', 'Recepcionista', '222.333.444-51', '(11) 90001-0051'),
(52, 'Zilda Silva', 'Recepcionista', '222.333.444-52', '(11) 90001-0052'),
(53, 'Alice Campos', 'Recepcionista', '222.333.444-53', '(11) 90001-0053'),
(54, 'Bruno Matos', 'Recepcionista', '222.333.444-54', '(11) 90001-0054'),
(55, 'Clara Fernandes', 'Recepcionista', '222.333.444-55', '(11) 90001-0055'),
(56, 'Diego Oliveira', 'Recepcionista', '222.333.444-56', '(11) 90001-0056'),
(57, 'Eduarda Lima', 'Recepcionista', '222.333.444-57', '(11) 90001-0057'),
(58, 'Fernando Santos', 'Recepcionista', '222.333.444-58', '(11) 90001-0058'),
(59, 'Gabriela Rocha', 'Recepcionista', '222.333.444-59', '(11) 90001-0059'),
(60, 'Hugo Dias', 'Recepcionista', '222.333.444-60', '(11) 90001-0060');


INSERT INTO Agendamento (funcionario_id, paciente_id, data_agendamento, tipo_consulta, status)
VALUES
(1, 1, '2025-06-10 10:00:00', 'Exame de rotina', 'Confirmado'),
(2, 2, '2025-06-11 14:00:00', 'Consulta de acompanhamento', 'Confirmado'),
(3, 3, '2025-06-12 09:00:00', 'Consulta para dor na perna', 'Pendente');

INSERT INTO Consulta (medico_id, paciente_id, data, diagnostico)
VALUES
(1, 1, '2025-06-10 10:30:00', 'Exame de rotina – Sem alterações'),
(2, 2, '2025-06-11 14:30:00', 'Acompanhamento pediátrico – Sem alterações'),
(3, 3, '2025-06-12 09:30:00', 'Fratura no fêmur – Exame solicitado');

INSERT INTO Internacao (paciente_id, unidade_id, medico_id, motivo_internacao, data_admissao, data_saida)
VALUES
(1, 1, 1, 'Infarto', '2025-06-15', '2025-06-20'),
(2, 2, 2, 'Febre alta', '2025-06-18', '2025-06-22'),
(3, 3, 3, 'Fratura no fêmur', '2025-06-12', '2025-06-15');

INSERT INTO Visita (paciente_id, data_visita, nome_visitante, relacionamento_visitante)
VALUES
(1, '2025-06-16', 'Carlos Silva', 'Irmão'),
(2, '2025-06-19', 'Lucas Oliveira', 'Amigo'),
(3, '2025-06-13', 'Fernanda Souza', 'Esposa');

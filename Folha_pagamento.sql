Create DATABASE Folha_pagamento;
USE Folha_pagamento;

-- 2. TABELA FUNCIONARIO (MANTIDA)
CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    usuario VARCHAR(255) UNIQUE, -- Adicionado UNIQUE, recomendado para login
    senha VARCHAR(255),
    nivel_acesso VARCHAR(50),
    salario_base DECIMAL(10, 2),
    auxilio_refeicao DECIMAL(10, 2),
    auxilio_alimentacao DECIMAL(10, 2),
    plano_saude DECIMAL(10, 2),
    outros_beneficios DECIMAL(10, 2),
    custo_efetivo_total DECIMAL(10, 2)
);

-- 3. TABELA ADMINISTRADOR (MANTIDA)
CREATE TABLE Administrador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(50) NOT NULL
);

-- 4. TABELA SIMPLES NACIONAL (AJUSTADA PARA COINCIDIR COM O CÓDIGO JAVA)
CREATE TABLE Simples_Nacional (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL UNIQUE,
    
    -- Campos básicos do funcModel
    auxilio_refeicao DECIMAL(10, 2),
    auxilio_alimentacao DECIMAL(10, 2),
    plano_saude DECIMAL(10, 2),
    outros_beneficios DECIMAL(10, 2),
    
    -- Campos do calculoModel (nomes padronizados para o Java)
    salario_base DECIMAL(10, 2),
    fgts_salario DECIMAL(10, 2),       -- Ajustado de 'fgts' para 'fgts_salario'
    subtotal DECIMAL(10, 2),
    
    ferias_prporcionais DECIMAL(10, 2), -- Ajustado para a grafia do Java
    adicional_ferias DECIMAL(10, 2),    -- Ajustado de 'adicional_um_terco'
    fgts_ferias_adicional DECIMAL(10, 2), -- Ajustado de 'fgts_ferias_adicional_um_terco'
    
    decimo_terceiro DECIMAL(10, 2),     -- Ajustado de 'decimo_terceiro_salario_1_12'
    fgts_decimo_terceiro DECIMAL(10, 2), -- Ajustado de 'fgts_decimo_terceiro_salario'
    
    aviso_previo DECIMAL(10, 2),        -- Ajustado de 'aviso_previo_1_12'
    fgts_aviso_previo DECIMAL(10, 2),   -- Ajustado de 'fgts_aviso_previo_1_12'
    multa_fgts DECIMAL(10, 2),          -- Ajustado de 'multa_fgts_1_12'
    
    subtotal_previsionado DECIMAL(10, 2),
    
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id)
);

-- 5. TABELA NÃO OPTANTE SIMPLES NACIONAL (AJUSTADA PARA COINCIDIR COM O CÓDIGO JAVA)
CREATE TABLE Nao_Optante_Simples_Nacional (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL UNIQUE,
    
    -- Campos básicos do funcModel
    auxilio_refeicao DECIMAL(10, 2),
    auxilio_alimentacao DECIMAL(10, 2),
    plano_saude DECIMAL(10, 2),
    outros_beneficios DECIMAL(10, 2),
    
    -- Campos do calculoModel (nomes padronizados para o Java)
    salario_base DECIMAL(10, 2),
    
    fgts_salario DECIMAL(10, 2),
    inss_sat_terceiros DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),          -- Usado para o subtotal do fluxo de caixa
    
    ferias_prporcionais DECIMAL(10, 2), -- Ajustado
    adicional_ferias DECIMAL(10, 2),    -- Ajustado
    fgts_ferias_adicional DECIMAL(10, 2),
    
    decimo_terceiro DECIMAL(10, 2),
    fgts_decimo_terceiro DECIMAL(10, 2),
    
    aviso_previo DECIMAL(10, 2),
    fgts_aviso_previo DECIMAL(10, 2),
    multa_fgts DECIMAL(10, 2),
    
    inss_sat_terceiros_provisoes DECIMAL(10, 2),
    subtotal_previsionado DECIMAL(10, 2),
    
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id)
);

-- 6. INSERÇÃO INICIAL
insert into Administrador(usuario,senha,nivel_acesso) values ("Fred","1234","Admin");

-- 7. CONSULTA PARA VERIFICAR
Select * from Funcionario;
Select * from Simples_Nacional;
-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-11-10 20:45:32 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE relation_18 (
    t_fintech_principal_nm_saldo             NUMBER NOT NULL, 

    t_fintech_servicos_t_fintech_servicos_id NUMBER NOT NULL
);

ALTER TABLE relation_18 ADD CONSTRAINT relation_18_pk PRIMARY KEY ( t_fintech_principal_nm_saldo,
                                                                    t_fintech_servicos_t_fintech_servicos_id );

CREATE TABLE relation_19 (
    t_fintech_principal_nm_saldo            NUMBER NOT NULL, 

    t_fintech_investimentos_nm_investimento VARCHAR2(33 CHAR) NOT NULL
);

ALTER TABLE relation_19 ADD CONSTRAINT relation_19_pk PRIMARY KEY ( t_fintech_principal_nm_saldo,
                                                                    t_fintech_investimentos_nm_investimento );

CREATE TABLE relation_20 (
    t_fintech_principal_nm_saldo NUMBER NOT NULL,
    t_fintech_credito_sl_conta   NUMBER NOT NULL
);

ALTER TABLE relation_20 ADD CONSTRAINT relation_20_pk PRIMARY KEY ( t_fintech_principal_nm_saldo,
                                                                    t_fintech_credito_sl_conta );

CREATE TABLE t_fintech_acesso (
    nr_conta                                                 NUMBER(12) NOT NULL,
    sn_conta                                                 VARCHAR2(12 CHAR) NOT NULL, 

    t_fintech_dados_cliente_t_fintech_criacao_usuario_nr_cpf NUMBER(11) NOT NULL
);

ALTER TABLE t_fintech_acesso ADD CONSTRAINT t_fintech_acesso_pk PRIMARY KEY ( nr_conta,
                                                                              sn_conta );

CREATE TABLE t_fintech_credito (
    sl_conta NUMBER NOT NULL,
    lm_saldo NUMBER
);

ALTER TABLE t_fintech_credito ADD CONSTRAINT t_fintech_credito_pk PRIMARY KEY ( sl_conta );

CREATE TABLE t_fintech_criacao_usuario (
    nr_cpf NUMBER(11) NOT NULL
);

ALTER TABLE t_fintech_criacao_usuario ADD CONSTRAINT t_fintech_criacao_usuario_pk PRIMARY KEY ( nr_cpf );

CREATE TABLE t_fintech_dados_cliente (
    nm_cliente                       VARCHAR2(33 CHAR) NOT NULL,
    en_cliente                       VARCHAR2(33 CHAR) NOT NULL,
    nm_telefone                      VARCHAR2(33 CHAR) NOT NULL,
    dt_nascimento_cliente            NUMBER(8) NOT NULL,
    ed_email_cliente                 VARCHAR2(33 CHAR) NOT NULL, 

    t_fintech_criacao_usuario_nr_cpf NUMBER(11) NOT NULL
);

ALTER TABLE t_fintech_dados_cliente ADD CONSTRAINT t_fintech_dados_cliente_pk PRIMARY KEY ( t_fintech_criacao_usuario_nr_cpf );

CREATE TABLE t_fintech_investimentos (
    nm_investimento VARCHAR2(33 CHAR) NOT NULL,
    dt_inicio       DATE NOT NULL,
    dt_fim          DATE NOT NULL
);

ALTER TABLE t_fintech_investimentos ADD CONSTRAINT t_fintech_investimentos_pk PRIMARY KEY ( nm_investimento );

CREATE TABLE t_fintech_principal (
    t_fintech_acesso_nr_conta NUMBER(12) NOT NULL,
    t_fintech_acesso_sn_conta VARCHAR2(12 CHAR) NOT NULL,
    nm_saldo                  NUMBER NOT NULL
);

ALTER TABLE t_fintech_principal ADD CONSTRAINT t_fintech_principal_pk PRIMARY KEY ( nm_saldo );

CREATE TABLE t_fintech_servicos (
    vl_cashback           NUMBER NOT NULL,
    pg_contas             VARCHAR2(33 CHAR) NOT NULL,
    t_fintech_servicos_id NUMBER NOT NULL
);

ALTER TABLE t_fintech_servicos ADD CONSTRAINT t_fintech_servicos_pk PRIMARY KEY ( t_fintech_servicos_id );


ALTER TABLE relation_18
    ADD CONSTRAINT relation_18_t_fintech_principal_fk FOREIGN KEY ( t_fintech_principal_nm_saldo )
        REFERENCES t_fintech_principal ( nm_saldo );


ALTER TABLE relation_18
    ADD CONSTRAINT relation_18_t_fintech_servicos_fk FOREIGN KEY ( t_fintech_servicos_t_fintech_servicos_id )
        REFERENCES t_fintech_servicos ( t_fintech_servicos_id );

 
ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_t_fintech_investimentos_fk FOREIGN KEY ( t_fintech_investimentos_nm_investimento )
        REFERENCES t_fintech_investimentos ( nm_investimento );


ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_t_fintech_principal_fk FOREIGN KEY ( t_fintech_principal_nm_saldo )
        REFERENCES t_fintech_principal ( nm_saldo );


ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_t_fintech_credito_fk FOREIGN KEY ( t_fintech_credito_sl_conta )
        REFERENCES t_fintech_credito ( sl_conta );


ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_t_fintech_principal_fk FOREIGN KEY ( t_fintech_principal_nm_saldo )
        REFERENCES t_fintech_principal ( nm_saldo );


ALTER TABLE t_fintech_acesso
    ADD CONSTRAINT t_fintech_acesso_t_fintech_dados_cliente_fk FOREIGN KEY ( t_fintech_dados_cliente_t_fintech_criacao_usuario_nr_cpf
    )
        REFERENCES t_fintech_dados_cliente ( t_fintech_criacao_usuario_nr_cpf );


ALTER TABLE t_fintech_dados_cliente
    ADD CONSTRAINT t_fintech_dados_cliente_t_fintech_criacao_usuario_fk FOREIGN KEY ( t_fintech_criacao_usuario_nr_cpf )
        REFERENCES t_fintech_criacao_usuario ( nr_cpf );

 
ALTER TABLE t_fintech_principal
    ADD CONSTRAINT t_fintech_principal_t_fintech_acesso_fk FOREIGN KEY ( t_fintech_acesso_nr_conta,
                                                                         t_fintech_acesso_sn_conta )
        REFERENCES t_fintech_acesso ( nr_conta,
                                      sn_conta );

CREATE SEQUENCE t_fintech_servicos_t_fintech_s START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_fintech_servicos_t_fintech_s BEFORE
    INSERT ON t_fintech_servicos
    FOR EACH ROW
    WHEN ( new.t_fintech_servicos_id IS NULL )
BEGIN
    :new.t_fintech_servicos_id := t_fintech_servicos_t_fintech_s.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0



CREATE TABLE aluno (
    mat_alu       NUMBER(10) NOT NULL,
    nome          VARCHAR2(100) NOT NULL,
    ano_ingresso  DATE NOT NULL,
    estado_civil  VARCHAR2(10) NOT NULL
);

ALTER TABLE aluno ADD CONSTRAINT alu_fk PRIMARY KEY ( mat_alu );

CREATE TABLE curso (
    cod_curso   	NUMBER(4) NOT NULL,
    nom_curso   	VARCHAR2(80) NOT NULL,
    num_credito 	NUMBER(2) NOT NULL,
    duracao_normal	NUMBER(2) NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT cur_pk PRIMARY KEY ( cod_curso );

CREATE TABLE departamentos (
    cod_dpto    NUMBER(3) NOT NULL,
    nome_dpto   VARCHAR2(50) NOT NULL
);

ALTER TABLE departamentos ADD CONSTRAINT departamentos_pk PRIMARY KEY ( cod_dpto );

CREATE TABLE disciplinas (
    cod_disc        NUMBER(5) NOT NULL,
    nome_disc       VARCHAR2(60) NOT NULL,
    num_credito     NUMBER(2) NOT NULL,
    natureza 	    CHAR(1) NOT NULL
);

ALTER TABLE disciplinas ADD CONSTRAINT disc_pk PRIMARY KEY ( cod_disc );

CREATE TABLE professor (
    mat_prof   NUMBER(10) NOT NULL,
    nome       VARCHAR2(100) NOT NULL,
    titulacao  VARCHAR2(20) NOT NULL,
    endereco   VARCHAR2(100) NOT NULL
);

ALTER TABLE professor ADD CONSTRAINT prof_pk PRIMARY KEY ( mat_prof );

CREATE TABLE turma (
    ano     NUMBER(4) NOT NULL,
    periodo NUMBER(2) NOT NULL,
    sala    VARCHAR(5) NOT NULL
);


ALTER TABLE aluno
    ADD CONSTRAINT alu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES curso ( cod_curso );

ALTER TABLE curso
    ADD CONSTRAINT cur_der_fk FOREIGN KEY ( cod_dpto )
        REFERENCES departamento ( cod_dpto );

ALTER TABLE matriculas
    ADD CONSTRAINT mat_alu_fk FOREIGN KEY ( mat_alu )
        REFERENCES aluno ( mat_alu );

ALTER TABLE matriculas
    ADD CONSTRAINT mat_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES disciplina ( cod_disc );

ALTER TABLE professor 
    ADD CONSTRAINT mcu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES curso ( cod_curso );

ALTER TABLE professor
    ADD CONSTRAINT mcu_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES disciplina ( cod_disc );

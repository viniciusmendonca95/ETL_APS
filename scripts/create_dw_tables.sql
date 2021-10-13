CREATE TABLE dm_curso (
    id_curso   NUMBER(4) NOT NULL,
    nome       VARCHAR2(50) NOT NULL
);

ALTER TABLE dm_curso ADD CONSTRAINT dm_curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE dm_departamento (
    id_departamento   NUMBER(4) NOT NULL,
    nome              VARCHAR2(50) NOT NULL
);

ALTER TABLE dm_departamento ADD CONSTRAINT dm_departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE dm_disciplina (
    id_disciplina   NUMBER(4) NOT NULL,
    nome            VARCHAR2(50) NOT NULL,
    natureza        CHAR(1 BYTE) NOT NULL
);

ALTER TABLE dm_disciplina ADD CONSTRAINT dm_disciplina_pk PRIMARY KEY ( id_disciplina );

CREATE TABLE dm_professor (
    id_professor   NUMBER(10) NOT NULL,
    nome           VARCHAR2(50) NOT NULL
);

ALTER TABLE dm_professor ADD CONSTRAINT dm_professor_pk PRIMARY KEY ( id_professor );

CREATE TABLE dm_tempo (
    id_tempo   NUMBER(6) NOT NULL,
    semestre   NUMBER(6) NOT NULL,
    ano        NUMBER(4) NOT NULL
);

ALTER TABLE dm_tempo ADD CONSTRAINT dm_tempo_pk PRIMARY KEY ( id_tempo );

CREATE TABLE ft_produtividade (
    id_tempo          NUMBER(6) NOT NULL,
    id_professor      NUMBER(10) NOT NULL,
    id_departamento   NUMBER(4) NOT NULL,
    id_curso          NUMBER(4) NOT NULL,
    id_disciplina     NUMBER(4) NOT NULL,
    qtd_aprovacao     NUMBER(5) NOT NULL,
    qtd_alunos        NUMBER(5) NOT NULL
);

ALTER TABLE ft_produtividade
    ADD CONSTRAINT ft_produtividade_dm_curso_fk FOREIGN KEY ( id_curso )
        REFERENCES dm_curso ( id_curso );

ALTER TABLE ft_produtividade
    ADD CONSTRAINT ft_produtividade_dm_depart_fk FOREIGN KEY ( id_departamento )
        REFERENCES dm_departamento ( id_departamento );

ALTER TABLE ft_produtividade
    ADD CONSTRAINT ft_produtividade_dm_disc_fk FOREIGN KEY ( id_disciplina )
        REFERENCES dm_disciplina ( id_disciplina );

ALTER TABLE ft_produtividade
    ADD CONSTRAINT ft_produtividade_dm_prof_fk FOREIGN KEY ( id_professor )
        REFERENCES dm_professor ( id_professor );

ALTER TABLE ft_produtividade
    ADD CONSTRAINT ft_produtividade_dm_tempo_fk FOREIGN KEY ( id_tempo )
        REFERENCES dm_tempo ( id_tempo );

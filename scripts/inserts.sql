/**********************************************************************************/
--Inserção na Tabela de Departamentos
insert into departamentos ( cod_dpto, nome_dpto ) values ( 001, 'Exatas' );
insert into departamentos ( cod_dpto, nome_dpto ) values ( 002, 'Saúde' );
commit;
/**********************************************************************************/
-- Inserção na Tabela de curso
insert into curso ( cod_curso, nom_curso, num_credito, duracao_normal ) values ( 0001, 'Ciências da Computação', 500, 90 );
insert into curso ( cod_curso, nom_curso, num_credito, duracao_normal ) values ( 0002, 'Engenharia Civil', 500, 90 );
insert into curso ( cod_curso, nom_curso, num_credito, duracao_normal ) values ( 0003, 'Medicina', 500, 90 );
commit;
/**********************************************************************************/
-- Inserção na Tabela de aluno
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567890, 'Vinicius', TO_DATE('2020-01-01', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567891, 'Cristiano', TO_DATE('2020-02-02', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567892, 'Thiago', TO_DATE('2020-03-03', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567893, 'José', TO_DATE('2020-04-04', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567894, 'João', TO_DATE('2020-05-05', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567895, 'Maria', TO_DATE('2020-06-06', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567896, 'Fábio', TO_DATE('2020-07-07', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567897, 'Cida', TO_DATE('2020-08-08', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567898, 'Matheus', TO_DATE('2020-09-09', 'yyyy/mm/dd'), 2020, 'Solteiro' );
insert into aluno ( mat_alu, nome, ano_ingresso, estado_civil ) values( 1234567899, 'Lucas', TO_DATE('2020-10-10', 'yyyy/mm/dd'), 2020, 'Solteiro' );
commit;
/**********************************************************************************/
--Inserção na Tabela de Disciplinas
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00001, 'Programação Orientada a Objetos', 80, "T" );
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00002, 'Banco de Dados', 40, "P" );
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00003, 'Analise de Estruturas', 80, "T" );
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00004, 'Calculo 1', 40, "P" );
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00005, 'Anatomia', 80, "T" );
insert into disciplinas ( cod_disc, nome_disc, num_credito, natureza ) values ( 00006, 'Praticas Medicas', 40, "P" );
commit;
/**********************************************************************************/
-- Inserção na Tabela de professor
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567890, 'Vinicius', 'mestre', 'rua A' );
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567891, 'Cristiano', 'mestre', 'rua A' );
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567892, 'Thiago', 'mestre', 'rua A' );
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567893, 'José', 'mestre', 'rua A' );
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567894, 'João', 'mestre', 'rua A' );
insert into professor ( mat_prof, nome, titulacao, endereco ) values ( 1234567895, 'Matheus', 'mestre', 'rua A' );
commit;
/**********************************************************************************/
-- Inserção na Tabela de turma
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 2, 'T' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'T' );
insert into turma ( ano, periodo, sala ) values ( 20211, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'T' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'T' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20211, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 1, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 2, 'A' );
insert into turma ( ano, periodo, sala ) values ( 20212, 1, 'A' );
commit;
/**********************************************************************************/
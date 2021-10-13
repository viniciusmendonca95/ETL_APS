create user aps
  identified by "aps"
  default tablespace DADOS_ACAD
  temporary tablespace TEMP_ACAD
  profile DEFAULT 
  quota unlimited on DADOS_ACAD
  quota unlimited on INDICES_ACAD;


grant connect to aps;
grant resource to aps;
grant create view to aps;

create user dw_aps
  identified by "dw_aps"
  default tablespace DADOS_ACAD
  temporary tablespace TEMP_ACAD
  profile DEFAULT 
  quota unlimited on DADOS_ACAD
  quota unlimited on INDICES_ACAD;


grant connect to dw_aps;
grant resource to dw_aps;
grant create view to dw_aps;
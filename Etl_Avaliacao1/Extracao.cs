using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Diagnostics;

namespace Etl_APS
{
  public class Extracao
  {
    public DataTable Tempos { get; private set; } = new DataTable();
    public DataTable Cursos { get; private set; } = new DataTable();
    public DataTable Departamentos { get; private set; } = new DataTable();
    public DataTable Disciplinas { get; private set; } = new DataTable();
    public DataTable Professores { get; private set; } = new DataTable();
    public DataTable Produtividades { get; private set; } = new DataTable();

    public Extracao(OracleConnection connection)
    {
      ExtrairTempo(connection);
      ExtrairCursos(connection);
      ExtrairDepartamentos(connection);
      ExtrairDisciplinas(connection);
      ExtrairProfessores(connection);
      ExtrairProdutividades(connection);
    }
    private void ExtrairTempo(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração do Tempo");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @"SELECT DISTINCT SEMESTRE
                                       FROM MATRICULAS ";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();

      Tempos.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração do Tempo" +
                        $" - Total extraido: {Tempos.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }
    private void ExtrairCursos(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração dos cursos");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @"SELECT DISTINCT COD_CURSO, 
                                                       NOM_CURSO
                                       FROM CURSOS ";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();

      Cursos.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração dos cursos" +
                        $" - Total extraido: {Cursos.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }
    private void ExtrairDepartamentos(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração dos departamentos");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @" SELECT DISTINCT COD_DPTO, 
                                                        NOME_DPTO 
                                        FROM DEPARTAMENTOS ";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();

      Departamentos.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração dos departamentos" +
                        $" - Total extraido: {Departamentos.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }
    private void ExtrairDisciplinas(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração das disciplinas");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @"SELECT DISTINCT COD_DISC, 
                                                       NOME_DISC 
                                       FROM DISCIPLINAS";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();

      Disciplinas.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração das disciplinas" +
                        $" - Total extraido: {Disciplinas.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }

    private void ExtrairProfessores(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração dos professores");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @"SELECT DISTINCT ID_PROF, 
                                                       NOME
                                       FROM PROFESSORES";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();

      Professores.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração dos professores" +
                        $" - Total extraido: {Professores.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }
    private void ExtrairProdutividades(OracleConnection connection)
    {
      Console.WriteLine("Iniciando extração das produtividades");
      var sw = new Stopwatch();
      sw.Start();
      connection.Open();

      OracleCommand commandSQL = connection.CreateCommand();

      commandSQL.CommandText = @"
                                       SELECT M.SEMESTRE,
                                              DIS.COD_DISC AS DISCIPLINA,
                                              DEP.COD_DPTO AS DEPARTAMENTO,
                                              A.COD_CURSO AS CURSO,
                                              PROF.ID_PROF AS PROFESSOR,
                                              M.NOTA,
                                        FROM MATRICULAS M
                                        JOIN PROFESSORES P on P.ID_PROF = P.ID_PROF
                                        JOIN CURSOS C on C.COD_CURSO = A.COD_CURSO
                                        JOIN DEPARTAMENTOS DEP on DEP.COD_DPTO = C.COD_DPTO
                                        JOIN DISCIPLINAS DIS on DIS.COD_DISC = M.COD_DISC";

      commandSQL.CommandType = CommandType.Text;

      OracleDataReader dr = commandSQL.ExecuteReader();
      Produtividades.Load(dr);
      connection.Close();
      sw.Stop();

      Console.WriteLine($"Finalizando extração das PRODUTIVIDADES" +
                        $" - Total extraido: {Produtividades.Rows.Count}" +
                        $" - Tempo de extração: {sw.Elapsed.TotalSeconds} segundos.");

    }
  }
}

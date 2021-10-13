using Etl_APS.Models.Dimensional;
using Etl_APS.Models.Operacional;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;

namespace Etl_APS
{
  public class Transformacao
  {
    public List<DmTempo> DmTempos { get; private set; } = new List<DmTempo>();
    public List<DmCurso> DmCursos { get; private set; } = new List<DmCurso>();
    public List<DmDepartamento> DmDepartamentos { get; private set; } = new List<DmDepartamento>();
    public List<DmDisciplina> DmDisciplinas { get; private set; } = new List<DmDisciplina>();
    public List<DmProfessor> DmProfessores { get; private set; } = new List<DmProfessor>();
    public List<FtProdutividade> FtProdutividades { get; private set; } = new List<FtProdutividade>();
    public Transformacao(Extracao extracao)
    {
      TransformarTempo(extracao.Tempos);
      TransformarCursos(extracao.Cursos);
      TransformarDepartamentos(extracao.Departamentos);
      TransformarDisciplinas(extracao.Disciplinas);
      TransformarProfessores(extracao.Professores);
      TransformarProdutividade(extracao.Produtividades);
    }
    private void TransformarTempo(DataTable data)
    {
      Console.WriteLine("Iniciando transformação do tempo");
      var sw = new Stopwatch();
      sw.Start();
      foreach (DataRow d in data.Rows)
      {
        DmTempos.Add(new DmTempo((int)d[0]));
      }
      sw.Stop();

      Console.WriteLine($"Finalizando transformação do tempo" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }
    private void TransformarCursos(DataTable data)
    {
      Console.WriteLine("Iniciando transformação dos cursos");
      var sw = new Stopwatch();
      sw.Start();
      foreach (DataRow d in data.Rows)
      {
        DmCursos.Add(new DmCurso(Convert.ToInt16(d[0]), (string)d[1]));
      }
      sw.Stop();

      Console.WriteLine($"Finalizando transformação do tempo" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }
    private void TransformarDepartamentos(DataTable data)
    {
      Console.WriteLine("Iniciando transformação dos departamentos");
      var sw = new Stopwatch();
      sw.Start();
      foreach (DataRow d in data.Rows)
      {
        DmDepartamentos.Add(new DmDepartamento(Convert.ToInt32(d[0]), (string)d[1]));
      }
      sw.Stop();

      Console.WriteLine($"Finalizando transformação dos departamentos" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }
    private void TransformarDisciplinas(DataTable data)
    {
      Console.WriteLine("Iniciando transformação das disciplinas");
      var sw = new Stopwatch();
      sw.Start();
      foreach (DataRow d in data.Rows)
      {
        DmDisciplinas.Add(new DmDisciplina((int)d[0], (string)d[1]));
      }
      sw.Stop();

      Console.WriteLine($"Finalizando transformação das disciplinas" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }

    private void TransformarProfessores(DataTable data)
    {
      Console.WriteLine("Iniciando transformação dos professores");
      var sw = new Stopwatch();
      sw.Start();
      foreach (DataRow d in data.Rows)
      {
        DmDisciplinas.Add(new DmProfessor((int)d[0], (string)d[1]));
      }
      sw.Stop();

      Console.WriteLine($"Finalizando transformação dos professores" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }
    private void TransformarProdutividade(DataTable data)
    {
      Console.WriteLine("Iniciando transformação das produtividades");
      var sw = new Stopwatch();
      sw.Start();
      var aux = new List<Produtividade>();
      foreach (DataRow d in data.Rows)
      {
        aux.Add(new Produtividade
        {
          Semestre = Convert.ToInt32(d[0]),
          IdDisciplina = Convert.ToInt32(d[1]),
          IdDepartamento = Convert.ToInt32(d[2]),
          IdCurso = Convert.ToInt32(d[3]),
          IdProfessor = Convert.ToInt32(d[4]),
          Nota = Convert.ToInt32(d[5]),

        });
      }

      FtProdutividades = aux.GroupBy(x => new
      {
        x.Semestre,
        x.IdCurso,
        x.IdDepartamento,
        x.IdDisciplina,
        x.IdProfessor
      })
      .Select(x => new FtProdutividade
      (
         x.Key.Semestre,
         x.Key.IdCurso,
         x.Key.IdDisciplina,
         x.Key.IdDepartamento,
         x.Key.IdProfessor,
         x.ToList()
      )).ToList();

      sw.Stop();

      Console.WriteLine($"Finalizando transformação das produtividades" +
                        $" - Tempo de transformação: {sw.Elapsed.TotalSeconds} segundos.");
    }
  }
}

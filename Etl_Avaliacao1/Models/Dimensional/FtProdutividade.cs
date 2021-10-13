using Etl_APS.Models.Operacional;
using System.Collections.Generic;
using System.Linq;

namespace Etl_APS.Models.Dimensional
{
    public class FtProdutividade
    {
        public int IdTempo { get; private set; }
        public int IdCurso { get; private set; }
        public int IdDisciplina { get; private set; }
        public int IdDepartamento { get; private set; }
        public int IdProfessor { get; private set; }
        public int QtdTotalAlunosAprovados { get; private set; }
        public int QtdTotalAlunos { get; private set; }

        public FtProdutividade(int idTempo, int idCurso,
                            int idDisciplina, int idDepartamento,
                            int idProfessor, List<Produtividade> group)
        {
            this.IdTempo = idTempo;
            this.IdCurso = idCurso;
            this.IdDisciplina = idDisciplina;
            this.IdDepartamento = idDepartamento;
            this.IdProfessor = IdProfessor;

            this.QtdTotalAlunosAprovados = CalcularTotalAlunosAprovados(group);
            this.QtdTotalAlunos = CalcularTotalAlunos(group);
        }

        private int CalcularTotalAlunos(List<Produtividade> data)
        {
            return data.Count();
        }
        private int CalcularTotalAlunosAprovados(List<Produtividade> data)
        {
            return data.Count(x =>
            {
                var aprovadoPorNota = x.Nota >= 7;

                return !(aprovadoPorNota);
            });
        }
    }
}

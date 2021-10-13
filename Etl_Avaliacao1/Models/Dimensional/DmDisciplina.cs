namespace Etl_APS.Models.Dimensional
{
    public class DmDisciplina
    {
        public int Id { get; private set; }
        public string Nome { get; private set; }
        public bool Natureza { get; private set; }

        public DmDisciplina(int id, string nome, bool natureza)
        {
            this.Id = id;
            this.Nome = nome;
            this.Natureza = natureza;
        }
    }
}

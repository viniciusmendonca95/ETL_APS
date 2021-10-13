namespace Etl_APS.Models.Dimensional
{
    public class DmProfessor
    {
        public int Id { get; private set; }
        public string Nome { get; private set; }

        public DmProfessor(int id, string nome)
        {
            this.Id = id;
            this.Nome = nome;
        }
    }
}

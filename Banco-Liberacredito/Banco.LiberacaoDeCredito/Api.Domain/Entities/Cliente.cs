using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Domain.Entities
{
    public partial class Cliente
    {
        public Cliente()
        {
            Financiamentos = new HashSet<Financiamento>();
        }

        public int Id { get; set; }

        public string Nome { get; set; } = null!;

        public string Cpf { get; set; } = null!;

        public string Uf { get; set; } = null!;

        public string Celular { get; set; } = null!;

        public virtual ICollection<Financiamento> Financiamentos { get; set; }
    }
}

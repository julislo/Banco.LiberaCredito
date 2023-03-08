using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Domain.Entities
{
    public partial class TipoDoFinanciamento
    {
        public TipoDoFinanciamento()
        {
            Financiamentos = new HashSet<Financiamento>();
        }

        public int Id { get; set; }

        public string Nome { get; set; } = null!;

        public decimal Juros { get; set; }

        public virtual ICollection<Financiamento> Financiamentos { get; set; }
    }



}

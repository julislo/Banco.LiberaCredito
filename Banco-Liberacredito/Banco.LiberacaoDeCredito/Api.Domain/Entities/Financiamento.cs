using System;
using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Domain.Entities
{
    public partial class Financiamento
    {
        public Financiamento()
        {
            Parcelas = new HashSet<Parcela>();
        }

        public int Id { get; set; }
        public int Cliente_id { get; set; }
        public string Cpf { get; set; }
        public int  Tipo_Financiamento { get; set; }
        public decimal Valor_total { get; set; }
        public DateTime Data_Vencimento { get; set; }
        
        public virtual ICollection<Parcela> Parcelas { get; set; }

        public virtual Cliente _Cliente_Id { get; set; } = null!;

        public virtual TipoDoFinanciamento _TipoDoFinanciamento { get; set; } = null!;

    }
}

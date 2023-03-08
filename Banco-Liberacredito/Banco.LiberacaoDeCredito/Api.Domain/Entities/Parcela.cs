using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Banco.LiberacaoDeCredito.Api.Domain.Entities
{
    public partial class Parcela
    {
        public int Id { get; set; }
        public int Id_Financiamento { get; set; }
        public int Numero_Parcela { get; set; }
        public decimal Valor_Parcela { get; set; }
        public DateTime Data_Vencimento { get; set; }
        public DateTime? Data_Pagamento { get; set; }      
        public int Id_Cliente { get; set; }

        public virtual Financiamento _FinanciamentoId { get; set; } = null!;       

    }
}

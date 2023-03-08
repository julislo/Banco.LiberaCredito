using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Domain.Interfaces
{
    public interface ITipoDoFinanciamentoService
    {
        IEnumerable<TipoDoFinanciamento> GetAll();
        TipoDoFinanciamento GetTipoDoFinanciamento(int tipo);
    }
}

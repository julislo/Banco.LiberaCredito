using Banco.LiberacaoDeCredito.Api.Data.Context;
using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using Banco.LiberacaoDeCredito.Api.Domain.Interfaces;
using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Service.Services
{
    public class TipoDoFinanciamentoService : ITipoDoFinanciamentoService
    {
        private MyContext _context;

        public TipoDoFinanciamentoService(MyContext context)
        {
            _context = context;
        }

        public IEnumerable<TipoDoFinanciamento> GetAll()
        {
            throw new System.NotImplementedException();
        }

        public TipoDoFinanciamento GetTipoDoFinanciamento(int tipo)
        {
            throw new System.NotImplementedException();
        }
    }
}

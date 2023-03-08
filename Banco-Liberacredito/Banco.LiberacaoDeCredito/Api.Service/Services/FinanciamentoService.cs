using Banco.LiberacaoDeCredito.Api.Data.Context;
using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using Banco.LiberacaoDeCredito.Api.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Banco.LiberacaoDeCredito.Api.Service.Services
{
    public class FinanciamentoService : IFinanciamentoService
    {
        private MyContext _context;

        public FinanciamentoService(MyContext context)
        {
            _context = context;
        }

        public IEnumerable<Financiamento> GetAll()
        {
            throw new NotImplementedException();
        }

        public Financiamento GetFinanciamento(int financiamento)
        {
            throw new NotImplementedException();
        }
    }
}

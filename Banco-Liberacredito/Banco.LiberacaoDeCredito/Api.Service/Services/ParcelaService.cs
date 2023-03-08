using Banco.LiberacaoDeCredito.Api.Data.Context;
using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using Banco.LiberacaoDeCredito.Api.Domain.Interfaces;
using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Service.Services
{
    public class ParcelaService : IParcelaService
    {
        private MyContext _context;

        public ParcelaService(MyContext context)
        {
            _context = context;
        }

        public IEnumerable<Parcela> GetAll()
        {
            throw new System.NotImplementedException();
        }

        public Parcela GetParcela(int parcela)
        {
            throw new System.NotImplementedException();
        }
    }
}

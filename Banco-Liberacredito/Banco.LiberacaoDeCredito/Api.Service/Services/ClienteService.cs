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
    internal class ClienteService : IClienteService 
    {
        private MyContext _context;

        public ClienteService(MyContext context)
        {
            _context = context;
        }

        public void Create(Cliente cliente)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Cliente> GetAll()
        {
            throw new NotImplementedException();
        }

        public Cliente GetCliente(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(int id, Cliente cliente)
        {
            throw new NotImplementedException();
        }
    }
}

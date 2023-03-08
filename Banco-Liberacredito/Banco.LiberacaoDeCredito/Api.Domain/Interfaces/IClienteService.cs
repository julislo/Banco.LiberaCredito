using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using System.Collections.Generic;

namespace Banco.LiberacaoDeCredito.Api.Domain.Interfaces
{
    public interface IClienteService
    {
        IEnumerable<Cliente> GetAll();
        Cliente GetCliente(int id);
        void Create(Cliente cliente);
        void Update(int id, Cliente cliente);
        void Delete(int id);

    }
}

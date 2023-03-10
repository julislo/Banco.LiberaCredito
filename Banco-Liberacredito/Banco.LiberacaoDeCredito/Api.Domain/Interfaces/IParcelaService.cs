using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Banco.LiberacaoDeCredito.Api.Domain.Interfaces
{
    public interface IParcelaService
    {
        IEnumerable<Parcela> GetAll();
        Parcela GetParcela(int parcela);

    }
}

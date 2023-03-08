using Banco.LiberacaoDeCredito.Api.Data.Context;
using Banco.LiberacaoDeCredito.Api.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Banco.LiberacaoDeCredito.Api.Service.Services
{
    public class LiberaCreditoService
    {
        private readonly MyContext _context;
        private readonly ClienteService _clienteService;

        public LiberaCreditoService(MyContext context)
        {
            _context = context;
            _clienteService = new ClienteService(context);
        }

        public void LiberarCredito()
        {
            Console.WriteLine("Digite o valor do emprestimo desejado:");
            string valorEmprestimo = Console.ReadLine();
            double vEmprestimo = validaValorEmprestimo(valorEmprestimo);

            TiposDeCredito();
            var tipoCredito = Console.ReadLine();

            Console.WriteLine("Digite o número de parcelas:");
            string numParcelas = Console.ReadLine();

            Console.WriteLine("Digite a data do primeiro vencimento da parcela:");
            string dataVencimento = Console.ReadLine();

            string msg = validaEmprestimo(vEmprestimo, tipoCredito, numParcelas, dataVencimento);

            if (msg == "")
            {
                Console.WriteLine("Emprestimo APROVADO.");

                double _valorParcela = calculaValorParcela(vEmprestimo, Convert.ToInt16(tipoCredito));
                Console.WriteLine("Valor total do emprestimo com juros: " + _valorParcela);

                double _valorJuros = calculaValorJuros(vEmprestimo, Convert.ToInt16(tipoCredito));
                Console.WriteLine("Valor dos juros: " + _valorJuros);

                Console.WriteLine("");
                Console.WriteLine("Pressione qualquer tecla para retornar ao Menu");
                Console.ReadKey();
                return;
            }
            else
            {
                Console.WriteLine("Empréstimo RECUSADO.");
                Console.WriteLine("Favor revisar itens a baixo: " + msg);
            }
        }

        public void BuscarClientes()
        {
            Console.WriteLine("Buscando resultados, por favor aguarde...");

            using (MyContext conn = _context)
            {
                try
                {
                    var clientes = conn.Clientes.Where(x => x.Uf == "SP");
                    List<Cliente> res = new List<Cliente>();

                    foreach (var i in clientes)
                    {
                        var pPagas = conn.Parcelas.Where(x => x.Id_Cliente == i.Id);

                        var pagas = pPagas.Where(x => x.Data_Pagamento != null).Count(); 
                        
                        if(pagas > 0)
                        {
                            var porcentagem = (pPagas.Count() / pagas) * 100;

                            if (porcentagem > 60)
                            {
                                res.Add(new Cliente
                                {
                                    Nome = i.Nome,
                                    Cpf = i.Cpf,
                                    Celular = i.Celular

                                });
                            }
                        }                          
                    }

                    if (res.Count > 0)
                    {
                        Console.WriteLine("Os clientes com 60% das parcelas estão listados a baixo: ");

                        foreach (var item in res)
                        {
                            Console.WriteLine("-----");
                            Console.WriteLine("Nome: {0}", item.Nome);
                            Console.WriteLine("Cpf: {0}", item.Cpf);
                            Console.WriteLine("-----");
                            Console.WriteLine("");
                        }
                    }
                    else
                    {
                        Console.WriteLine("A busca não gerou resultados.");
                        Console.WriteLine("");
                    }

                    _context.Dispose();

                }


                catch (Exception ex)
                {
                    Console.WriteLine("Ocorreu um erro na busca dos resultados." + ex.Message);
                }
            }
        }

        public void ParcelasEmAtraso()
        {
            Console.WriteLine("Buscando resultados, por favor aguarde...");

            using (MyContext conn = _context)
            {
                try
                {
                    List<Cliente> res = new List<Cliente>();
                    var clientes = conn.Clientes;

                    foreach (var i in clientes)
                    {
                        var pAtrasadas = conn.Parcelas.Where(
                                x => x.Id_Cliente == i.Id
                                && x.Data_Pagamento == null
                                && DateTime.Today > x.Data_Vencimento);

                        foreach (var pa in pAtrasadas)
                        {
                            var vencimento = pa.Data_Vencimento;
                            var now = DateTime.Today;

                            if (now > vencimento)
                            {
                                res.Add(new Cliente
                                {
                                    Nome = i.Nome,
                                    Cpf = i.Cpf
                                });
                            }
                        }                        
                    }

                    if (res.Count > 0)
                    {
                        foreach (var item in res)
                        {
                            Console.WriteLine("-----");
                            Console.WriteLine("Nome: {0}", item.Nome);
                            Console.WriteLine("Cpf: {0}", item.Cpf);
                            Console.WriteLine("-----");
                            Console.WriteLine("");
                        }
                    }
                    else
                    {
                        Console.WriteLine("A busca não gerou resultados.");
                        Console.WriteLine("");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Ocorreu um erro na busca dos resultados." + ex.Message);
                }
            }
        }


        /*------------------------------------------------------------------------*/

        public void TiposDeCredito()
        {
            Console.WriteLine("Digite o número da opção de crédito que deseja:");
            Console.WriteLine("1 - Crédito Direto - Taxa de 2% ao mês");
            Console.WriteLine("2 - Crédito Consignado - Taxa de 1% ao mês");
            Console.WriteLine("3 - Crédito Pessoa Jurídica - Taxa de 5% ao mês");
            Console.WriteLine("4 - Crédito Pessoa Física - Taxa de 3% ao mês");
            Console.WriteLine("5 - Crédito Imobiliário - Taxa de 9% ao mês");
        }

        public double validaValorEmprestimo(string _valor)
        {
            double valor;
            if (double.TryParse(_valor, out valor))
                return (double)valor;
            return -1;
        }

        public string validaEmprestimo(double vEmprestimo, string tipoCredito, string numParcelas, string dataVencimento)
        {
            //verificar 
            string msgErro = "";

            if (vEmprestimo > 1000000)
            {
                msgErro += " Valor máximo a ser liberado para qualquer tipo de empréstimo é de R$ 1.000.000,00";
            }

            if (Convert.ToInt16(tipoCredito) == 3 && vEmprestimo < 15000)
            {
                msgErro += " Para o crédito de pessoa jurídica, o valor mínimo a ser liberado é de R$ 15.000,00";
            }

            if (Convert.ToInt16(numParcelas) < 5 || Convert.ToInt16(numParcelas) > 72)
            {
                msgErro += " A quantidade minima de parcelas é 5x e a máxima é de 72x.";
            }

            if (DateTime.UtcNow.AddDays(15) >= Convert.ToDateTime(dataVencimento) || DateTime.UtcNow.AddDays(40) >= Convert.ToDateTime(dataVencimento))
            {
                msgErro += " A data do primeiro vencimento deve ser no mínimo 15 dias e no máximo 40 dias a partir da data de hoje.";
            }

            return msgErro;
        }

        public double calculaValorParcela(double vEmprestimo, int tipoCredito)
        {
            double valorTotal = 0.0;
            switch (tipoCredito)
            {
                case 1:
                    valorTotal = (vEmprestimo * 0.02) + vEmprestimo;
                    break;
                case 2:
                    valorTotal = (vEmprestimo * 0.01) + vEmprestimo;
                    break;
                case 3:
                    valorTotal = (vEmprestimo * 0.05) + vEmprestimo;
                    break;
                case 4:
                    valorTotal = (vEmprestimo * 0.03) + vEmprestimo;
                    break;
                case 5:
                    valorTotal = (vEmprestimo * 0.09) + vEmprestimo;
                    break;
                default:
                    break;
            }

            return valorTotal;
        }

        public double calculaValorJuros(double vEmprestimo, int tipoCredito)
        {
            double valorTotalJuros = 0.0;
            switch (tipoCredito)
            {
                case 1:
                    valorTotalJuros = vEmprestimo * 0.02;
                    break;
                case 2:
                    valorTotalJuros = vEmprestimo * 0.01;
                    break;
                case 3:
                    valorTotalJuros = vEmprestimo * 0.05;
                    break;
                case 4:
                    valorTotalJuros = vEmprestimo * 0.03;
                    break;
                case 5:
                    valorTotalJuros = vEmprestimo * 0.09;
                    break;
                default:
                    break;
            }
            return valorTotalJuros;
        }

    }
}

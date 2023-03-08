using Banco.LiberacaoDeCredito.Api.Data.Context;
using Banco.LiberacaoDeCredito.Api.Service.Services;
using System;

namespace Banco.LiberacaoDeCredito
{
    public class Program
    {
        static void Main(string[] args)
        {
            var opcao = "";

            while(opcao != "Sair")
            {
                listaOpcoes();

                opcao = Console.ReadLine();

                _opcaoEscolhida(opcao);

            }
        }

        public static void listaOpcoes()
        {
            Console.WriteLine("Escolha a opção desejada:");
            Console.WriteLine("1 - Liberação de crédito");
            Console.WriteLine("2 - Clientes do estado de SP que possuem mais de 60% das parcelas pagas");
            Console.WriteLine("3 - Primeiros quatro clientes que possuem alguma parcela com mais de cinco dias em atraso");            
            Console.WriteLine("4 - Sair");

        }

        public static void _opcaoEscolhida(string opcao)
        {
            LiberaCreditoService service = new LiberaCreditoService(new MyContext());

            switch (opcao)
            {
                case "1":
                    service.LiberarCredito();
                    break;
                case "2":
                    service.BuscarClientes();
                    break;
                case "3":
                    service.ParcelasEmAtraso();
                    break;
                case "Sair":
                    Environment.Exit(0);
                    break;
                default:
                    Console.WriteLine("Por favor, digite uma opção válida.");
                    break;
            }
        }
    }
}

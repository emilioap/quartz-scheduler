using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StatusMachine.Application;
using StatusMachine.Application.DI;
using StatusMachine.Infra.Configuration;
using System;
using System.IO;

namespace StatusMachine.Processor
{

    class Program
    {
        private static IConfigurationRoot Configuration { get; set; }

        private static void ConfigureServices(IServiceCollection serviceCollection)
        {
            DIBootstrap.Configure(serviceCollection, Configuration);
        }

        private static void ConfigureOptions(IServiceCollection serviceCollection)
        {
            Configuration = ConfigurationFactory.Create(Directory.GetCurrentDirectory());
        }

        static void Main(string[] args)
        {
            Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);

            IServiceCollection serviceCollection = new ServiceCollection();

            ConfigureOptions(serviceCollection);

            ConfigureServices(serviceCollection);

            var serviceProvider = serviceCollection.BuildServiceProvider();

            var aservice = serviceProvider.GetService<StatusMachineAppService>();
            aservice.Start();

            Console.WriteLine();
            Console.ReadKey();
        }

    }
}

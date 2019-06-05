using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StatusMachine.Application.Jobs;
using StatusMachine.Domain;
using StatusMachine.Domain.Interface;
using StatusMachine.Repository;

namespace StatusMachine.Application.DI
{
    public static class DIBootstrap
    {
        public static void Configure(IServiceCollection serviceCollection, IConfigurationRoot configurationRoot) =>
            serviceCollection
                .AddSingleton(configurationRoot)
                .AddSingleton<IStatusMachineRepository, StatusMachineRepository>()
                .AddSingleton<IStatusMachineService, StatusMachineService>()
                .AddSingleton<StatusJob>()
                .AddSingleton<StatusMachineAppService>();
    }
}

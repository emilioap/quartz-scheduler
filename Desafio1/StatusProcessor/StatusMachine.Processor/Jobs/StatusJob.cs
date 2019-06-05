using Quartz;
using StatusMachine.Domain.Interface;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace StatusMachine.Application.Jobs
{
    class StatusJob : IJob
    {
        private readonly IStatusMachineService statusMachineService;

        public StatusJob(IStatusMachineService statusMachineService)
        {
            this.statusMachineService = statusMachineService;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            var result = await this.statusMachineService.VerifyStatus();
            Console.WriteLine($"INFORMAÇÃO: Job executado em {DateTime.Now.ToString()}.");
        }
    }
}

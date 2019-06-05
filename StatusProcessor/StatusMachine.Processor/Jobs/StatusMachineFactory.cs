using Quartz;
using Quartz.Spi;
using System;

namespace StatusMachine.Application.Jobs
{
    class StatusMachineFactory : IJobFactory
    {
        private readonly IServiceProvider serviceProvider;

        public StatusMachineFactory(IServiceProvider serviceProvider)
        {
            this.serviceProvider = serviceProvider;
        }

        public IJob NewJob(TriggerFiredBundle bundle, IScheduler scheduler)
        {
            var service = (StatusJob)this.serviceProvider.GetService(typeof(StatusJob));
            return service;
        }

        public void ReturnJob(IJob job)
        {
            var disposable = job as IDisposable;
            disposable?.Dispose();
        }
    }
}

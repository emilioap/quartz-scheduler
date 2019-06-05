using Microsoft.Extensions.Configuration;
using Quartz;
using Quartz.Impl;
using StatusMachine.Application.Jobs;
using System;

namespace StatusMachine.Application
{
    class StatusMachineAppService
    {
        private readonly IConfigurationRoot configurationRoot;
        private readonly IServiceProvider serviceProvider;

        public StatusMachineAppService(IConfigurationRoot configurationRoot, IServiceProvider serviceProvider)
        {
            this.configurationRoot = configurationRoot;
            this.serviceProvider = serviceProvider;
        }

        public void Start()
        {
            StdSchedulerFactory factory = new StdSchedulerFactory();
            IScheduler scheduler = factory.GetScheduler().Result;
            scheduler.Start().Wait();
            ScheduleJobs(scheduler);
        }

        public void Stop()
        {
        }

        private void ScheduleJobs(IScheduler scheduler)
        {
            scheduler.JobFactory = new StatusMachineFactory(serviceProvider);
            IJobDetail job = JobBuilder.Create<StatusJob>().Build();
            ITrigger trigger = TriggerBuilder.Create()
                .StartNow()
                .WithSimpleSchedule(x => x
                .WithIntervalInSeconds(20)
                .RepeatForever())
                .Build();

            scheduler.ScheduleJob(job, trigger).Wait();
        }
    }
}

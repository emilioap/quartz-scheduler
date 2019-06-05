using StatusMachine.Domain.Entity;
using StatusMachine.Domain.Enum;
using StatusMachine.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;

namespace StatusMachine.Domain
{
    public class StatusMachineService : IStatusMachineService
    {
        private readonly IStatusMachineRepository statusMachineRepository;

        public StatusMachineService(IStatusMachineRepository statusMachineRepository)
        {
            this.statusMachineRepository = statusMachineRepository;
        }

        public async Task<bool> VerifyStatus()
        {
            IEnumerable<HistoryStatusEntity> statusEntity;
            statusEntity = await this.statusMachineRepository.GetAll();

            foreach (var item in statusEntity)
            {
                if(item.IdStatus != StatusEnum.Entregue || item.IdStatus != StatusEnum.Cancelado)
                {
                    switch (item.IdStatus)
                    {
                        case StatusEnum.PedidoCriado:
                            if ((DateTime.Now - item.DataStatus).TotalMinutes > 1)
                                SendAlert(item);
                            break;
                        case StatusEnum.AnaliseCredito:
                            if ((DateTime.Now - item.DataStatus).TotalMinutes > 10)
                                SendAlert(item);
                            break;
                        case StatusEnum.PagamentoAprovado:
                            if ((DateTime.Now - item.DataStatus).TotalHours > 2)
                                SendAlert(item);
                            break;
                        case StatusEnum.PagamentoRecusado:
                            if ((DateTime.Now - item.DataStatus).TotalDays > 3)
                                SendAlert(item);
                            break;
                        default:
                            if ((DateTime.Now - item.DataStatus).TotalDays > 2)
                                SendAlert(item);
                            break;
                    }
                }
            }

            return true;
        }

        public void SendAlert(HistoryStatusEntity historyStatus)
        {
            Console.WriteLine($"ALERTA: Atraso na alteração do status {historyStatus.IdStatus} para o Pedido #{historyStatus.IdPedido}.");
        }
    }
}

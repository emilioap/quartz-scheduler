using StatusMachine.Domain.Enum;
using System;

namespace StatusMachine.Domain.Entity
{
    public class HistoryStatusEntity
    {
        public int IdPedido { get; set; }
        public StatusEnum IdStatus { get; set; }
        public DateTime DataStatus { get; set; }
        public int Ordem { get; set; }
    }
}

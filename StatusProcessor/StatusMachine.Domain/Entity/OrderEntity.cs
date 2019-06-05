using StatusMachine.Domain.Enum;
using System;

namespace StatusMachine.Domain.Entity
{
    public class OrderEntity
    {
        public int IdPedido { get; set; }
        public StatusEnum IdStatus { get; set; }
        public double ValorPedido { get; set; }
        public DateTime DataPrevisaoEntrega { get; set; }
    }
}

using Dapper;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using StatusMachine.Domain.Entity;
using StatusMachine.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using System.Linq.Expressions;
using System.Linq;

namespace StatusMachine.Repository
{
    public class StatusMachineRepository : IStatusMachineRepository
    {
        private const string selectAllOrders = "SELECT * FROM pedido WHERE idPedido < 7";
        private const string historyProcedure = "ConsultarHistoricoPedido";

        public List<HistoryStatusEntity> historyStatuses;
        private IConfigurationRoot _configuration;

        public StatusMachineRepository(IConfigurationRoot config)
        {
            _configuration = config;
        }

        public async Task<IEnumerable<HistoryStatusEntity>> GetAll()
        {

            using (MySqlConnection connect = new MySqlConnection(_configuration.GetConnectionString("FrameworkDatabase")))
            {
                try
                {
                    connect.Open();

                    IEnumerable<OrderEntity> orders;
                    orders = await connect.QueryAsync<OrderEntity>(selectAllOrders, commandType: CommandType.Text);

                    historyStatuses = new List<HistoryStatusEntity>();

                    foreach (var item in orders)
                    {
                        IEnumerable<HistoryStatusEntity> result = await connect.QueryAsync<HistoryStatusEntity>(historyProcedure, new { IdPedido = item.IdPedido }, commandType: CommandType.StoredProcedure);
                        historyStatuses.Add(result.OrderByDescending(o => o.Ordem).First());
                    }

                    return historyStatuses;
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    connect.Close();
                }
            }

        }
    }
}

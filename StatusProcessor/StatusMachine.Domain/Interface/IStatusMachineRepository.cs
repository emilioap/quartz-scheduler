using StatusMachine.Domain.Entity;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StatusMachine.Domain.Interface
{
    public interface IStatusMachineRepository
    {
        Task<IEnumerable<HistoryStatusEntity>> GetAll();
    }
}

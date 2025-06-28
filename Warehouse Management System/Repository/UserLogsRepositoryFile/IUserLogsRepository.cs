using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserLogsRepositoryFile
{
    public interface IUserLogsRepository
    {
        public List<UserLog> getAllUserLogs(string userId);
        public ApplicationUser UpdateUserLogs(ApplicationUser user ,string ActionType ,string AdditionalInfo ="NO");
    }
}

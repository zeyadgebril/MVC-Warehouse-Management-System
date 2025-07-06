using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserRepositoryFile
{
    public interface IUserRepository :IRepository<User>
    {
        void Update(User entity);
    }
}

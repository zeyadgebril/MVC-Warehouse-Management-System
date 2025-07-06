using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserRepositoryFile
{
    public interface IUserRepository :IRepository<ApplicationUser>
    {
        public void Update(ApplicationUser entity);

        public ApplicationUser getById(string id);
    }
}

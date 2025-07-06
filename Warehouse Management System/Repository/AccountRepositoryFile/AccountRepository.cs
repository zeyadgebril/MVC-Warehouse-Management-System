using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;


namespace Warehouse_Management_System.Repository.AccountRepositoryFile
{
    public class AccountRepository : IAccountRepository
    {
        private readonly dbContext db;

        public AccountRepository(dbContext db)
        {
            this.db = db;
        }
        public int GetNumberOfSuspended()
        {
            return db.Users.Where(e => e.IsSuspended == true && e.IsDeleted == false && e.LockoutEnabled == true).Count(); ;
        }

        public void MakeHimLookOfflineForAdmin(string id)
        {
           var data= db.Users.FirstOrDefault(e => e.Id == id);
            data.IsActive=false;
            db.SaveChanges();
        }

        public void MakeHimLookOnlineForAdmin(string id)
        {
            var data = db.Users.FirstOrDefault(e => e.Id == id);
            data.IsActive = true;
            db.SaveChanges();
        }

        public void SignOutFormApplication(Claim AddressClaim)
        {
        }
    }
}

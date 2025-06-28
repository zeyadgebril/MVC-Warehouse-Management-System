using System.Runtime.Intrinsics.Arm;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserLogsRepositoryFile
{
    public class UserLogsRepository : IUserLogsRepository
    {
        private readonly dbContext db;

        public UserLogsRepository(dbContext db)
        {
            this.db = db;
        }
        public List<UserLog> getAllUserLogs(string userId)
        {
            return db.UserLogs.Where(e=>e.UserID == userId).ToList();
        }

        public ApplicationUser UpdateUserLogs(ApplicationUser user, string ActionType, string AdditionalInfo = "NO")
        {
            var currentUser =db.Users.FirstOrDefault(e=>e.UserName == user.UserName);
            var userLogs = new UserLog()
            {
                UserID = user.Id,
                ActionType = ActionType,
                AdditionalInfo = AdditionalInfo,
                TimeStamp = DateTime.UtcNow,
            };
           currentUser.LastLogin= DateTime.UtcNow;
            db.UserLogs.Add(userLogs);
            db.SaveChanges();
            return currentUser;
        }
    }
}

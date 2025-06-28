using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModel.Zeyad;

namespace Warehouse_Management_System.Repository.AdminRepositoryFile
{
    public class AdminRepository : IAdminRepository
    {
        private readonly dbContext db;

        public AdminRepository(dbContext db)
        {
            this.db = db;
        }
        public RequestUserDataVM ApproveUser()
        {
            var ApprovalData = new RequestUserDataVM();
            var AllUserRequest = new List<ListOfRequestUserVM>();
            var users = db.Users.Where(e=>e.IsSuspended==true&& e.IsDeleted == false).ToList();
            ApprovalData.PindingRequests =db.Users.Where(e=>e.IsSuspended==true&&e.IsDeleted==false).Count();
            ApprovalData.ApprovedUser = db.Users.Where(e => e.IsSuspended == false && e.IsDeleted == false).Count();
            ApprovalData.DeclineUser = db.Users.Where(e => e.IsSuspended == true && e.IsDeleted == true).Count();

            foreach (var user in users)
            {
                var NewUserRequest = new ListOfRequestUserVM();

                NewUserRequest.UserId=user.Id;
                NewUserRequest.UserName = user.UserName;
                NewUserRequest.Email = user.Email;
                NewUserRequest.RequestedDate = user.CreatedDate;
                NewUserRequest.LastLog = db.UserLogs
                    .Where(e => e.UserID == user.Id)
                    .OrderByDescending(e => e.LogID)
                    .Select(e => e.TimeStamp)
                    .FirstOrDefault();

                if (NewUserRequest.UserName.Contains("@"))
                {
                    NewUserRequest.UserName = NewUserRequest.UserName.Split('@')[0];
                }

                AllUserRequest.Add(NewUserRequest);
            }
            ApprovalData.Users = AllUserRequest;
            return ApprovalData;
        }

        public void SetRequest(string id, string request)
        {
            var User= db.Users.FirstOrDefault(e => e.Id==id);
            if (User != null)
            {
                if(request == "Approve")
                {
                    User.IsSuspended = false;
                }
                else
                {
                    User.IsSuspended = true;
                    User.IsDeleted = true;
                }
            }
            db.SaveChanges();
        }
    }
}

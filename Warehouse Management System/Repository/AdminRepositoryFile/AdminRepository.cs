using System.Runtime.Intrinsics.Arm;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using NuGet.Versioning;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModel.Zeyad;

namespace Warehouse_Management_System.Repository.AdminRepositoryFile
{
    public class AdminRepository : IAdminRepository
    {
        private readonly dbContext db;
        private readonly UserManager<ApplicationUser> userManager;

        public AdminRepository(dbContext db,UserManager<ApplicationUser> userManager)
        {
            this.db = db;
            this.userManager = userManager;
        }
        public RequestUserDataVM ApproveUser()
        {
            var ApprovalData = new RequestUserDataVM();
            var AllUserRequest = new List<ListOfRequestUserVM>();
            var users = db.Users.Where(e => e.IsSuspended == true && e.IsDeleted == false && e.LockoutEnabled == true).ToList();
            ApprovalData.PindingRequests = db.Users.Where(e => e.IsSuspended == true && e.IsDeleted == false).Count();//////////////////////
            ApprovalData.ApprovedUser = db.Users.Where(e => e.IsSuspended == false && e.IsDeleted == false).Count();
            ApprovalData.DeclineUser = db.Users.Where(e => e.IsSuspended == true && e.LockoutEnabled==false).Count();

            foreach (var user in users)
            {
                var NewUserRequest = new ListOfRequestUserVM();

                NewUserRequest.UserId = user.Id;
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

        public List<UsersManegmentVM> GetSelectedUser(string name,int page =1)
        {
            int pageSize = 4;

            return name switch
            {
                "all" => db.Users .Select(item => new UsersManegmentVM
                                    {
                                        userId = item.Id,
                                        UserName = item.UserName,
                                        Activitistatus = item.IsActive,
                                        AppApproval = !item.IsSuspended,
                                        LastLog = item.LastLogin.ToString("g")
                                    })
                                    .Skip((page - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToList(),
                "active" => db.Users.Where(e => e.IsSuspended == false)
                                    .Select(item => new UsersManegmentVM
                                    {
                                        userId = item.Id,
                                        UserName = item.UserName,
                                        Activitistatus = item.IsActive,
                                        AppApproval = !item.IsSuspended,
                                        LastLog = item.LastLogin.ToString("g")
                                    })
                                    .Skip((page - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToList(),
                "inactive" => db.Users.Where(e => e.IsSuspended == true)
                                    .Select(item => new UsersManegmentVM
                                    {
                                        userId = item.Id,
                                        UserName = item.UserName,
                                        Activitistatus = item.IsActive,
                                        AppApproval = !item.IsSuspended,
                                        LastLog = item.LastLogin.ToString("g")
                                    })
                                    .Skip((page - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToList(),

            };
        }

        public UserProfileDetails GetUserBrID(string id)
        {
            var user = db.Users.FirstOrDefault(e => e.Id == id);
            var totalLogs = db.UserLogs.Where(e => e.UserID == id).Count();
            return new UserProfileDetails()
            {
                UserId = id,
                Fullname = user.FullName,
                Email = user.Email,
                Phone = user.PhoneNumber,
                MemberSince = user.CreatedDate,
                AccountStatus = user.IsActive,
                LastLogin = user.LastLogin,
                TotalLogins = totalLogs,
                Location = user.Address,
            };

        }

        public AllUsersManegmentsVM GetUserManegment(int page = 1, int pageSize = 10)
        {
            AllUsersManegmentsVM allUsers = new AllUsersManegmentsVM();

            allUsers.TotalUsers = db.Users.Count(e => e.IsDeleted != true);
            allUsers.ActiveUser = db.Users.Count(e => e.IsActive && e.IsDeleted!=true);
            allUsers.Suspended = db.Users.Count(e => e.IsSuspended && e.IsDeleted != true);
            allUsers.InactiveUser=allUsers.TotalUsers-allUsers.ActiveUser;
            allUsers.CurrentPage = page;
            allUsers.TotalPages = (int)Math.Ceiling((double)allUsers.TotalUsers / pageSize); ;


            var allUsersInRole = db.Users.ToList();
            allUsers.TotalUsersInRole = allUsersInRole.Count;  

            var pagedUsers = allUsersInRole
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            foreach (var item in pagedUsers)
            {
                UsersManegmentVM users = new UsersManegmentVM
                {
                    userId = item.Id,
                    UserName = item.UserName,
                    Activitistatus = item.IsActive,
                    AppApproval=!item.IsSuspended,
                    LastLog = item.LastLogin.ToString("g"),
                    
                    
                };

                SuspendOrApproveUserVM suspendOrApproveUserVM = new SuspendOrApproveUserVM();
                suspendOrApproveUserVM.UserId = item.Id;

                allUsers.Users.Add(users);
            }

            return allUsers;
        }

        public List<UsersManegmentVM> GetUsersBySeach(string name,int page =1)
        {
            var normalizedSearch = name.ToUpper();
            int pageSize = 4;

            return db.Users
                .Where(e => string.IsNullOrEmpty(name) || e.NormalizedEmail.Contains(normalizedSearch))
                .Select(item => new UsersManegmentVM
                {
                    userId = item.Id,
                    UserName = item.UserName,
                    Activitistatus = item.IsActive,
                    AppApproval = !item.IsSuspended,
                    LastLog = item.LastLogin.ToString("g")
                })
                 .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();
        }
        public bool SetRequest(string id, string request)
        {
            bool condition = false;
            var User = db.Users.FirstOrDefault(e => e.Id == id);
            if (User != null)
            {
                if (request == "Approve")
                {
                    User.IsSuspended = false;
                    User.LockoutEnabled = true;
                }
                else
                {
                    User.IsSuspended = true;
                    User.LockoutEnabled = false;
                }
                condition = true;
            }
            db.SaveChanges();

            return condition;
        }

        public DashpoardData GetDashpoardData()
        {
            var DashpoardData = new DashpoardData();
            //public int totalUsers { get; set; }
            //public int thisMonth { get; set; }
            //public string activeRate { get; set; }
            //public int MyProperty { get; set; }
            //public userGrowth userGrowth { get; set; }
            //public loginDistribution loginDistribution { get; set; }

            DashpoardData.totalUsers = db.Users.Count();
            DashpoardData.thisMonth = db.Users.Where(e =>e.CreatedDate.Month == DateTime.UtcNow.Month).Count();
            var activeUser = db.Users.Where(e => e.IsDeleted == false && e.IsSuspended == false && e.LockoutEnabled == true).Count();
            var SuspendedUser = db.Users.Where(e => e.IsDeleted == false && e.IsSuspended == true && e.LockoutEnabled == false).Count();
            DashpoardData.activeRate = (activeUser / SuspendedUser).ToString() ;
            DashpoardData.onlineNow=db.Users.Where(e=>e.IsActive==true).Count();
            DashpoardData.userGrowth.labels = db.Users
                                                .Select(e => new { e.CreatedDate.Year, e.CreatedDate.Month })
                                                .Distinct()
                                                .OrderBy(x => x.Year).ThenBy(x => x.Month)
                                                .Select(x => $"{x.Month}-{x.Year}")
                                                .ToList();
            DashpoardData.userGrowth.Data= db.Users
                                             .GroupBy(u => new { u.CreatedDate.Year, u.CreatedDate.Month })
                                             .Select(g => g.Count())
                                             .ToList();

            DashpoardData.loginDistribution.labels = new[] { "Google Account", "Normal Account" }.ToList();
            DashpoardData.loginDistribution.Data = new List<int>
            {
                db.Users.Where(e=>e.Address=="From Extirnal login").Count(),
                db.Users.Where(e=>e.Address!="From Extirnal login").Count(),
            };
            var top5RecentUsers = db.UserLogs
    .GroupBy(log => log.UserID)  // Group by UserID to get distinct users
    .OrderByDescending(group => group.Max(log => log.TimeStamp))  // Order by their latest timestamp
    .Select(group => group.Key)  // Select the UserID
    .Take(5)  // Take the top 5 newest
    .ToList();


            foreach (var id in top5RecentUsers)
            {
                var user = db.Users.FirstOrDefault(e=>e.Id==id);
                recentLogins recent = new recentLogins()
                {
                    fullName = user.FullName,
                    loginTime = user.LastLogin.ToString("G"),
                    status = (user.IsActive) ? "Online" : "Offline",
                    location = user.Address,
                };
                recent.initials = recent.fullName[0].ToString();
                DashpoardData.recentLogins.Add(recent);
            }

            //DashpoardData.recentLogins

            return DashpoardData;

        }

        public bool IsApprovedByAdmin(string id)
        {
          return db.Users.FirstOrDefault(e => e.Id == id).IsSuspended;
        }
    }
}
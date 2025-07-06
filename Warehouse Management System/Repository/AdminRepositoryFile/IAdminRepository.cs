using Warehouse_Management_System.ViewModel.Zeyad;

namespace Warehouse_Management_System.Repository.AdminRepositoryFile
{
    public interface IAdminRepository
    {
        public RequestUserDataVM ApproveUser();
        public bool SetRequest(string id, string request);
        public AllUsersManegmentsVM GetUserManegment(int page = 1, int pageSize = 10);
        public List<UsersManegmentVM> GetUsersBySeach(string name, int page = 1);
        public List<UsersManegmentVM> GetSelectedUser(string name, int page = 1);
        public UserProfileDetails GetUserBrID(string id);
        public DashpoardData GetDashpoardData();
        public bool IsApprovedByAdmin(string id);


    }
}
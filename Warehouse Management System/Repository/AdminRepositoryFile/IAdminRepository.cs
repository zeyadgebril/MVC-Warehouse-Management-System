using Warehouse_Management_System.ViewModel.Zeyad;

namespace Warehouse_Management_System.Repository.AdminRepositoryFile
{
    public interface IAdminRepository
    {
        public RequestUserDataVM ApproveUser();
        public void SetRequest(string id , string request);
    }
}

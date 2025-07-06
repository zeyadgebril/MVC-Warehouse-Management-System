using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.CategoryRepositoryFile
{
    public interface ICategoryRepository:IRepository<Category>
    {
        //search
        List<Category> SearchByName(string name); 

    }
}

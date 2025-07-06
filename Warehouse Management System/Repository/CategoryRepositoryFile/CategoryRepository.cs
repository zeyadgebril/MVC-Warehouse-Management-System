using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.CategoryRepositoryFile
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly dbContext _context;

        public CategoryRepository(dbContext context)
        {
            _context = context;
        }

        public void add(Category entity)
        {
            _context.Categories.Add(entity);
            _context.SaveChanges();
        }

        public List<Category> getAll()
        {
            return _context.Categories
                .Where(c => c.isDeleted == false)
                .ToList();
        }

        public Category getById(int id)
        {
            return _context.Categories
                .FirstOrDefault(c => c.CategoryID == id && c.isDeleted == false);
        }

        public void Update(Category entity)
        {
            var categoryFromDb = getById(entity.CategoryID);
            if (categoryFromDb != null)
            {
                categoryFromDb.Name = entity.Name;
                categoryFromDb.Description = entity.Description;
                _context.SaveChanges();
            }
        }

        public void delete(Category entity)
        {
            var categoryFromDb = getById(entity.CategoryID);
            if (categoryFromDb != null)
            {
                categoryFromDb.isDeleted = true; 
                _context.SaveChanges();
            }
        }

        public List<Category> SearchByName(string name)
        {
            return _context.Categories
                .Where(c => c.isDeleted == false && c.Name.Contains(name))
                .ToList();
        }
    }
}

using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.ProductRepositoryFile
{
   /* public class ProductRepository : IProductRepository
    {
        private readonly dbContext db;

        public ProductRepository(dbContext db)
        {
            this.db = db;
        }
        public void add(Product entity)
        {
            db.Products.Add(entity);
        }
        //SoftDelete
        public void delete(Product entity)
        {
            var data = getById(entity.ProductId);
            if (data != null)
            {
                data.IsDeleted = true;
                Update(data);
            }
        }
        //get all exipt the deleted ones
        public List<Product> getAll()
        {
           return db.Set<Product>().Where(e=>e.IsDeleted!=true).ToList();
        }
        //get product adn it's not deleted
        public Product getById(int id)
        {
            return db.Set<Product>()
                  .Where(e => e.IsDeleted != true)
                  .FirstOrDefault(e=>e.ProductId==id);
        }

        public void Update(Product entity)
        {
            db.Entry(entity).State=Microsoft.EntityFrameworkCore.EntityState.Modified;
        }
    }*/
}

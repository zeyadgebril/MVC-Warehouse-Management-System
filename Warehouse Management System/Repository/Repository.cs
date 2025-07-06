
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        public dbContext Db { get; }

        public Repository(dbContext db)
        {
            Db = db;
        }


        public void add(TEntity entity)
        {
            Db.Set<TEntity>().Add(entity);
        }

        public void delete(int id)
        {

            var entity = getById(id);
            var property = typeof(TEntity).GetProperty("isDeleted");
            if (property != null && property.PropertyType == typeof(bool?))
            {
                property.SetValue(entity, true);
                Db.Entry(entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;

            }

        }

        public List<TEntity> getAll()
        {
            return Db.Set<TEntity>().ToList();
        }

        public TEntity getById(int id)
        {
            return Db.Set<TEntity>().Find(id);
            
        }

        public void Update(TEntity entity,int id)
        {
            Db.Entry(entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
        }

        public void delete(TEntity entity)
        {
        }

        public void Update(TEntity entity)
        {
        }
    }
}

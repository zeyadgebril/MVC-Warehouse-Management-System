using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.MapperConfig;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.ViewModels;

namespace Warehouse_Management_System
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            //==================SessionnConfiguration====================
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential= true;
            });
            //======================SQLInjection=========================
            builder.Services.AddDbContext<MvcDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
            //======================Injection============================
            builder.Services.AddScoped<UnitOfWork>();

            //====================UserManagerInjection===================
            //builder.Services.AddIdentity<ApplicationUser, IdentityUser>(option =>
            //{
            //ConfigurationBinder for the user
            //}).AddEntityFrameworkStores<OwerNewContext>();
            //======================EndInjection=========================

            //======================Automapper=========================
            builder.Services.AddAutoMapper(typeof(mapperConfig));



            var app = builder.Build();

            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseRouting();
            app.UseSession();
            app.UseAuthorization();
            app.MapStaticAssets();
            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}")
                .WithStaticAssets();

            app.Run();
        }
    }
}

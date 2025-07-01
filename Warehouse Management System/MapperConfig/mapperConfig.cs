using AutoMapper;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModels;

namespace Warehouse_Management_System.MapperConfig
{
    public class mapperConfig:Profile
    {
        //Implement the mapping config

        public mapperConfig()
        {
            CreateMap<Product, ProductViewModel>()
               .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category.Name));
            CreateMap<ProductViewModel, Product>();
        }

    }
}

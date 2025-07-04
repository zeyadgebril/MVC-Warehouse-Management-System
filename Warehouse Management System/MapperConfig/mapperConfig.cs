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
               .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category != null ? src.Category.Name : string.Empty))
               .ForMember(dest => dest.ImageFile, opt => opt.Ignore()); // ImageFile is only in ViewModel

            CreateMap<ProductViewModel, Product>()
               .ForMember(dest => dest.Category, opt => opt.Ignore()) // Don't map Category navigation property
               .ForMember(dest => dest.InventoryRecords, opt => opt.Ignore()) // Ignore navigation properties
               .ForMember(dest => dest.InventoryTransactions, opt => opt.Ignore())
               .ForMember(dest => dest.ProductHistories, opt => opt.Ignore())
               .ForMember(dest => dest.Returns, opt => opt.Ignore())
               .ForMember(dest => dest.Supplier_Products, opt => opt.Ignore());
        }

    }
}

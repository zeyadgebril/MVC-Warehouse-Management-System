using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
namespace Warehouse_Management_System.CheckOutViewModels;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;
using Warehouse_Management_System.CheckOutViewModels;
using Microsoft.AspNetCore.Authorization;

[Authorize(Roles = "user")]

public class CartController : Controller
{
    private readonly UnitOfWork _unitOfWork;

    public CartController(UnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public IActionResult Index()
    {
        var cart = CartSessionHelper.GetCart(HttpContext.Session);
        return View("Cart", cart); ;
    }

    public IActionResult AddToCart(int id)
    {
        var product = _unitOfWork.ProductRepository.getById(id);
        if (product == null) return NotFound();

        var cart = CartSessionHelper.GetCart(HttpContext.Session);
        var existingItem = cart.FirstOrDefault(p => p.ProductId == id);

        if (existingItem != null)
            existingItem.Quantity++;
        else
        {
            cart.Add(new CartItem
            {
                ProductId = product.ProductId,
                Name = product.Name,
                UnitPrice = product.UnitPrice ?? 0,
                Quantity = 1,
                CategoryId = product.CategoryId ?? 0
            });
        }

        CartSessionHelper.SaveCart(HttpContext.Session, cart);

        HttpContext.Session.SetString("ReturnUrl", Request.Headers["Referer"].ToString());

        return RedirectToAction("Index", "Cart");
    }


    public IActionResult Clear()
    {
        CartSessionHelper.SaveCart(HttpContext.Session, new List<CartItem>());
        return RedirectToAction("Index");
    }



    ////////////////////////////////////////////////

    [HttpPost]
    [IgnoreAntiforgeryToken]
    public IActionResult UpdateQuantity([FromBody] QuantityUpdateModel data)
    {
        var cart = CartSessionHelper.GetCart(HttpContext.Session);
        var item = cart.FirstOrDefault(p => p.ProductId == data.ProductId);

        var product = _unitOfWork.ProductRepository.getById(data.ProductId); 
        if (item != null && product != null)
        {
            int newQuantity = item.Quantity + data.Change;

            if (newQuantity > product.CurrentQuantity)
            {
                return BadRequest($"Only {product.CurrentQuantity} items available in stock.");
            }

            item.Quantity = newQuantity;

            if (item.Quantity <= 0)
                cart.Remove(item);

            CartSessionHelper.SaveCart(HttpContext.Session, cart);

            return Ok();
        }

        return NotFound();
    }

    public class QuantityUpdateModel
    {
        public int ProductId { get; set; }
        public int Change { get; set; }
    }



    public IActionResult Invoice()
    {
        var cart = CartSessionHelper.GetCart(HttpContext.Session);

        ViewBag.Categories = _unitOfWork.CategoryRepository.getAll();

        return View(cart);
    }






}

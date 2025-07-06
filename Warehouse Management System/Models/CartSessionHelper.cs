using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Collections.Generic;
using Warehouse_Management_System.CheckOutViewModels;

public static class CartSessionHelper
{
    public static void SaveCart(ISession session, List<CartItem> cart)
    {
        var json = JsonConvert.SerializeObject(cart);
        session.SetString("cart", json);
    }

    public static List<CartItem> GetCart(ISession session)
    {
        var data = session.GetString("cart");
        return string.IsNullOrEmpty(data)
            ? new List<CartItem>()
            : JsonConvert.DeserializeObject<List<CartItem>>(data);
    }
}
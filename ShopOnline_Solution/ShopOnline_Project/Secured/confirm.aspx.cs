using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
namespace ShopOnline_Project.Secured
{
    public partial class confirm : System.Web.UI.Page
    {
        ShopDbContext db = new ShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
            Order order = new Order { CustomerId = customer.CustomerId, OrderDate = DateTime.Now };
            db.Orders.Add(order);
            var cartitems = db.CartItems.Where(c => c.CustomerId == customer.CustomerId).ToList();
            foreach (var x in cartitems)
            {
                OrderItem oi = new OrderItem { ProductId = x.ProductId, Quantity = x.Quantity, Order = order };
                db.CartItems.Remove(x);
                db.OrderItems.Add(oi);
            }
            
            db.SaveChanges();
            
        }
    }
}
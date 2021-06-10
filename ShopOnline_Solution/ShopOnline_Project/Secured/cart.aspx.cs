using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ShopOnline_Project.Models;
namespace ShopOnline_Project.Secured
{
    public partial class cart : System.Web.UI.Page
    {
        decimal total = 0;
        ShopDbContext db = new ShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                
                
                int productid = int.Parse(Request.QueryString["id"]);
                
                if (db.CartItems.Any(c => c.CustomerId == customer.CustomerId && c.ProductId == productid))
                {
                    var item = db.CartItems.First(c => c.CustomerId == customer.CustomerId && c.ProductId == productid);
                    item.Quantity++;
                }
                else
                {
                    var item = new CartItem { CustomerId = customer.CustomerId, ProductId = productid, Quantity = 1 };
                    db.CartItems.Add(item);
                }
                db.SaveChanges();
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<ShopOnline_Project.Models.CartItemVM> cartGrid_GetData()
        {
            
            var query= db.CartItems.Where(item=> item.CustomerId == customer.CustomerId).Select(item=> new CartItemVM{ CartItemId=item.CartItemId, CustomerId=item.CartItemId, ProductId=item.ProductId, Quantity=item.Quantity}).ToList();
            foreach (var x in query)
            {
                var product = db.Products.First(p => p.ProductId == x.ProductId);
                x.ProductName = product.ProductName;
                x.UnitPrice = product.UnitPrice;
                x.Amount = x.Quantity * product.UnitPrice;
            }
            return query.AsQueryable();
        }

        protected void cartGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal amt = decimal.Parse( DataBinder.Eval(e.Row.DataItem, "Amount").ToString());
                total += amt;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = total.ToString("0.00");
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void cartGrid_UpdateItem(int CartItemId)
        {
            ShopOnline_Project.Models.CartItemVM itemToEdit = null;
            itemToEdit = new CartItemVM { CartItemId = CartItemId };
            if (itemToEdit == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CartItemId));
                return;
            }
            TryUpdateModel(itemToEdit);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                var ci = db.CartItems.Find(CartItemId);
                ci.Quantity = itemToEdit.Quantity;
                db.SaveChanges();

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void cartGrid_DeleteItem(int CartItemId)
        {
            var ci = db.CartItems.Find(CartItemId);
            if (ci == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CartItemId));
                return;
            }
            db.CartItems.Remove(ci);
            db.SaveChanges();

        }
    }
}
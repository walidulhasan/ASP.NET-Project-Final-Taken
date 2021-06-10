using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopOnline_Project.Admin
{
    public partial class createproduct : System.Web.UI.Page
    {
        ShopDbContext db = new ShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void productInsertView_InsertItem()
        {
            var item = new ShopOnline_Project.Models.Product();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.Products.Add(item);
                db.SaveChanges();
                Response.Redirect("products.aspx");

            }
        }

        protected void productInsertView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload f =productInsertView.FindControl("PictureFileUpload") as FileUpload;
            if (f.HasFile)
            {
                if(f.PostedFile.ContentLength>0)
                {
                    f.SaveAs(Server.MapPath("~/Images/" + f.FileName));
                    e.Values["PictureFile"] = f.FileName;
                }
            }
            else
            {
                e.Values["PictureFile"] = "NoPicture.jpg";
            }
            
        }
    }
}
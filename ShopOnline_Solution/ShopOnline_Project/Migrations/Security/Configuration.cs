namespace ShopOnline_Project.Migrations.Security
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using ShopOnline_Project.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ShopOnline_Project.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            MigrationsDirectory = @"Migrations\Security";
            ContextKey = "ShopOnline_Project.Models.ApplicationDbContext";
        }

        protected override void Seed(ShopOnline_Project.Models.ApplicationDbContext context)
        {
            string[] roles = new string[] { "Admins", "Members", "Annonymous" };
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            foreach (var r in roles)
            {
                if (!context.Roles.Any(x => x.Name == r))
                {
                    roleManager.Create(new IdentityRole(r));
                }
            }
            //
            var userStore = new UserStore<ApplicationUser>(context);


            if (!(context.Users.Any(u => u.UserName == "admin@bd.com")))
            {
                var userManager = new UserManager<ApplicationUser>(userStore);
                var userToInsert = new ApplicationUser { UserName = "admin@bd.com", PhoneNumber = "01711112233" };
                var result = userManager.CreateAsync(userToInsert, "@Password123");
                if (result.Result.Succeeded)
                    userManager.AddToRole(userToInsert.Id, "Admins");
            }
        }
    }
}

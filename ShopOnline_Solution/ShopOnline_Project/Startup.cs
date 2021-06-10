using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopOnline_Project.Startup))]
namespace ShopOnline_Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

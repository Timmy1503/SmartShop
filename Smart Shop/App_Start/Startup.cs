using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using System.Security.Claims;
using System.Threading.Tasks;
[assembly: OwinStartup(typeof(Smart_Shop.App_Start.Startup))]

namespace Smart_Shop.App_Start
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {

            //app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);
            //app.UseCookieAuthentication(new CookieAuthenticationOptions
            //{
            //    LoginPath = new PathString("/User/Index"),
            //    SlidingExpiration = true
            //});
            //app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            //{
            //    ClientId = "661998463579-jd2frlb6c9sd5fh8m9tehkdh07l9ps5h.apps.googleusercontent.com",
            //    ClientSecret = "7JDCzJRRYs9liu49f0byf9qu", /*"AIzaSyBXKLoS_4mmQsf3OgYOpEOTKPOuaLrcYKQ",*/

            //    CallbackPath = new PathString("/User/GoogleLoginCallback")
            //});


        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Models
{
    public class UseAuthorize  : AuthorizeAttribute
    {

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {

            if (httpContext.Request.Cookies["KullaniciAdi"]!=null)
            {
                return true;
            }
            else
            {
                httpContext.Response.Redirect("/Login/Index");

                return false;
            }

        }
    }
}
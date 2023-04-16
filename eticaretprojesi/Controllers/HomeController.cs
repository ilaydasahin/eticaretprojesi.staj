using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class HomeController : Controller
    {

        // GET: Home
        public ActionResult Index()
        {

            if (Request.Cookies["KullaniciAdi"]==null)
            {
                return View("Index");
            }
            else
            {
                ViewBag.KullaniciAdi = Request.Cookies["KullaniciAdi"].Value;
            }
          

            return View();
        }

       public PartialViewResult durum()
        {

            return PartialView(new Durum().durummodell());
        }
      
    }

    
}
using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class TeslimatController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();
        public ActionResult Index()
        {

            ViewBag.teslimat = db.TeslimatBilgileri.ToList();
            return View();
        }

     
    }
}
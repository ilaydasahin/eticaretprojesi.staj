using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class İadeController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();
        public ActionResult Index()
        {

            ViewBag.iade = db.IadeKosullari.ToList();
            return View();
        }

        [HttpPost]

        public ActionResult Index(IadeKosullari data)
        {

            var guncelenecekiade = db.IadeKosullari.Where(x => x.Id == 1).FirstOrDefault();

            guncelenecekiade.Ahatar_kelime = data.Ahatar_kelime;
            guncelenecekiade.Baslik = data.Baslik;
            guncelenecekiade.Title = data.Title;
            guncelenecekiade.Icerik = data.Icerik;
            int sonuc = db.SaveChanges();

            if (sonuc==1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("Index");
        }
    }
}
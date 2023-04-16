using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class UyelikSözlesmesiController : Controller
    {

        eticaretprojesiEntities db = new eticaretprojesiEntities();
        public ActionResult Index()
        {

            ViewBag.uyelik = db.UyeSozlesmesi.ToList();
            return View();
        }

        [HttpPost]

        public ActionResult Index(UyeSozlesmesi data)
        {

            var guncelenecekuyelik = db.UyeSozlesmesi.Where(x => x.Id == 1).FirstOrDefault();

            guncelenecekuyelik.Anahtar_Kelime = data.Anahtar_Kelime;
            guncelenecekuyelik.Baslik = data.Baslik;
            guncelenecekuyelik.Title = data.Title;
            guncelenecekuyelik.Icerik = data.Icerik;

            int sonuc = db.SaveChanges();
            if (sonuc==1)
            {
                TempData["sonuc"] = 1;
            }
            return RedirectToAction("Index");
        }

    }
}
using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class HakkımızdaController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult Index()
        {

            ViewBag.hakkimizda = db.Hakkimizda.ToList();
            return View();
        }

        [HttpPost]

        public ActionResult Index(Hakkimizda data)
        {
            var guncelencekhakkimizda = db.Hakkimizda.Where(x => x.Id == 1).FirstOrDefault();

            guncelencekhakkimizda.Anahtar_kelime = data.Anahtar_kelime;
            guncelencekhakkimizda.Baslik = data.Baslik;
            guncelencekhakkimizda.Title = data.Title;
            guncelencekhakkimizda.Icerik = data.Icerik;

            int sonuc = db.SaveChanges();

            if (sonuc==1)
            {
                TempData["sonuc"] = 1;
            }

            return RedirectToAction("Index");
        }
    }
}
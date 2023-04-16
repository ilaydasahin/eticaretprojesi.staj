using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    public class OzelliklerController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult Ekle()
        {
            ViewBag.kategori = db.Kategoriler.ToList();

            return View();
        }


        [HttpPost]

        public ActionResult Ekle(Ozellik model)
        {
            if (ModelState.IsValid)
            {
                db.Ozellik.Add(model);

                int sonuc = db.SaveChanges()
;
                if (sonuc == 1)
                {
                    TempData["sonuc"] = 1;
                }

            }

            return RedirectToAction("liste");
        }


        public ActionResult liste()
        {
            List<OzellikList> ozelliklerliste = db.Ozellik.Include("Kategori").Select(x => new OzellikList
            {

                Id = x.Id,
                Tanim = x.Tanim,
                KategoriAdi = x.Kategoriler.Tanim

            }).ToList();

            return View(ozelliklerliste);

        }
    }
}
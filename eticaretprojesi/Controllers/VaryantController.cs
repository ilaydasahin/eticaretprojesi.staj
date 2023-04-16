using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{

    [UseAuthorize]
    public class VaryantController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();
        public ActionResult Ekle()
        {

            ViewBag.kategori = db.Kategoriler.ToList();
            return View();
        }

        [HttpPost]

        public ActionResult Ekle(Varyant model)
        {
            if (ModelState.IsValid)
            {
                db.Varyant.Add(model);

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
            List<VaryantListe> varyantlist = db.Varyant.Include("Kategori").Select(x => new VaryantListe
            {

                Id = x.Id,
                Tanim = x.Tanim,
                KategoriAdi = x.Kategoriler.Tanim

            }).ToList();

            return View(varyantlist);

        }

        public ActionResult Sil(int id)
        {

            Varyant silincekvaryant = (from x in db.Varyant where x.Id == id select x).FirstOrDefault();
            return View(silincekvaryant);
        }

        [HttpPost, ActionName("Sil")]

        public ActionResult Silmeislemi(int id)
        {

            Varyant silincekvaryant = (from x in db.Varyant where x.Id == id select x).FirstOrDefault();

            int? kategoriId = silincekvaryant.KategoriId;


            db.Varyant.Remove(silincekvaryant);

            int sonuc = db.SaveChanges();

            if (sonuc==1)
            {
                TempData["sonuc"] = 1;
            }
            return RedirectToAction("liste");
        }

        public ActionResult guncelle(int id)
        {

            try
            {

                if (id==null)
                {
                    return RedirectToAction("liste");
                }


                var guncellenecekvaryant = db.Varyant.Where(x => x.Id == id).FirstOrDefault();

                if (guncellenecekvaryant==null)
                {
                    return RedirectToAction("liste");

                }

                var kategori = db.Kategoriler.ToList();

                ViewBag.kategori = kategori;

                return View(guncellenecekvaryant);
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }

        [HttpPost]

        public ActionResult guncelle(Varyant model)
        {

            try
            {
                var guncellencekvaryant = db.Varyant.Find(model.Id);
                guncellencekvaryant.KategoriId = model.KategoriId;
                guncellencekvaryant.Tanim = model.Tanim;
                int sonuc = db.SaveChanges();

                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;
                }

                return RedirectToAction("liste", model.Id);
            }
            catch (Exception)
            {

                return RedirectToAction("liste", model.Id);
            }
        }




    }
}
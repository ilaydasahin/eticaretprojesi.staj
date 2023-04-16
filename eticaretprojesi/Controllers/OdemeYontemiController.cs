using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class OdemeYontemiController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult Ekle()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Ekle(OdemeYontemi data)
        {
            db.OdemeYontemi.Add(data);
            int sonuc = db.SaveChanges();

            if (sonuc==1)
            {
                TempData["sonuc"] = 1;
            }

            return RedirectToAction("liste");
        }

        public ActionResult liste()
        {


            var odemeyeyontemleri = db.OdemeYontemi.ToList();


            return View(odemeyeyontemleri);
        }

        public ActionResult sil(int id)
        {

            try
            {
                var silincekyontem = db.OdemeYontemi.Find(id);

                db.OdemeYontemi.Remove(silincekyontem);
                int sonuc = db.SaveChanges();

                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;
                }

                return RedirectToAction("liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }


        public ActionResult guncelle(int id)
        {

            try
            {

                var guncelecekyontem = db.OdemeYontemi.Where(x => x.Id == id).FirstOrDefault();

                return View(guncelecekyontem);

            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }


        [HttpPost]

        public ActionResult guncelle(OdemeYontemi data)
        {

            try
            {
                var guncelenecekyontem = db.OdemeYontemi.Where(x => x.Id == data.Id).FirstOrDefault();

                guncelenecekyontem.Aciklama = data.Aciklama;
                guncelenecekyontem.Tanim = data.Tanim;

                int sonuc = db.SaveChanges();

                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;
                }

                return RedirectToAction("liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }

    }
}
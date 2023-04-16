using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class StokController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult Takip()
        {

            try
            {
                var list = db.Urunler.ToList();
                return View(list);

            }
            catch (Exception)
            {

                return RedirectToAction("Takip");
            }
        }

        public ActionResult guncelle(int? id)
        {
            try
            {
                var guncelenecekstok = db.Urunler.Where(x => x.Id == id).FirstOrDefault();
                return View(guncelenecekstok);
                    

            }
            catch (Exception)
            {

                throw;
            }

        }


        [HttpPost]

        public ActionResult guncelle(Urunler data)
        {
            try
            {
                Urunler guncelenecekadet = db.Urunler.Where(x => x.Id == data.Id).FirstOrDefault();

                guncelenecekadet.Adet = data.Adet;
                int sonuc = db.SaveChanges();

                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;
                }


                return RedirectToAction("Takip");


            }
            catch (Exception)
            {

                return RedirectToAction("Takip");
            }

        }


    }
}
using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace eticaretprojesi.Controllers
{
    public class UrunlerController : Controller
    {

        eticaretprojesiEntities db = new eticaretprojesiEntities();

       
        public ActionResult Ekle()
        {

            ViewBag.kategori = db.Kategoriler.ToList();
            ViewBag.ozellikler = db.Ozellik.ToList();
       
            return View();
        }

        [HttpPost]

        public ActionResult UrunEkle(Urunler model,UrunVaryant varyant)
        {
            try
            {
                
                db.Urunler.Add(model);
                foreach (var item in model.UrunVaryant)
                {
                    item.OzelliklerId = varyant.OzelliklerId;
                    item.UrunId = varyant.Id;
                    db.UrunVaryant.Add(item);

                }
           
                db.SaveChanges();

                return RedirectToAction("Varyant", "liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");

            }


        }

        public ActionResult Kategori(int KategoriId)
        {
            var liste = db.Kategoriler.Where(x => x.UstKategoriId == KategoriId).Select(x => new
            {
                x.Id,
                x.Tanim

            }).ToList();


            JavaScriptSerializer javaScript = new JavaScriptSerializer();

            string result = javaScript.Serialize(liste);
            return Json(result, JsonRequestBehavior.AllowGet);

        }


        [HttpPost]

        public ActionResult VaryantGetir(int KategoriId)
        {

            var liste = db.Varyant.Where(x => x.KategoriId == KategoriId).Select(x => new
            {
                x.Id,
                x.Tanim
            }).ToList();




            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            string result = javaScriptSerializer.Serialize(liste);

            return Json(result, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]

        public ActionResult OzellikGetir(int KategoriId)
        {

      
            var liste2 = db.Ozellik.Where(x => x.KategoriId == KategoriId).Select(x => new {
                x.Id,
                x.Tanim
            }).ToList();

           


            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            string result = javaScriptSerializer.Serialize(liste2);

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]

        public JsonResult ResimYukle()
        {
            if (Request.Files.Count > 0) //sayfan resim seçildi ise
            {
                try
                {
                    string resimler = "";
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  

                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }

                        fname = Guid.NewGuid() + fname; //resmin adını benzersiz kıldık.

                        //fname = DateTime.Now.Year.ToString() + DateTime.Now.Month + DateTime.Now.Day +fname;
                        //dosya adının başına Tarih ekledik

                        resimler += fname + ";"; //geriye resim isimlerini döndürüp , ürün ekle yapıldığında bu isimleri veri tabanına kaydedeceğiz
                        // a.jpg ; b.jpg ; v.jpg ; d.png

                        fname = Path.Combine(Server.MapPath("/content/images/"), fname);
                        file.SaveAs(fname); //resmi klasöre kaydetti


                        //ResimDonustur(file.FileName, fname);

                        //resmi farklı boyutlarda kaydetmek için ResimDonustur metodunu oluşturduk.




                    }
                    // Returns message that successfully uploaded  
                    return Json(resimler);
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("Dosya Seçilmedi");
            }


        }

        public ActionResult liste()
        {

            try
            {
                var listele = db.Urunler.ToList();
                return View(listele);
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }

        public ActionResult sil(int id)
        {

            try
            {
                var silinecekurunun = db.UrunVaryant.Where(x => x.UrunId == id).FirstOrDefault();

                for (int i = 0; i < silinecekurunun.UrunId.Value; i++)
                {
                    db.UrunVaryant.Remove(silinecekurunun);
                    int sonuc1 = db.SaveChanges();

                    var silinecek = db.Urunler.Find(id);
                    db.Urunler.Remove(silinecek);
                    int sonucc = db.SaveChanges();
                    if (sonucc == 1)
                    {
                        TempData["sonuc"] = 1;
                    }
                }

               
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
            return RedirectToAction("liste");
        }

        public ActionResult guncelle(int id)

        {


            var kategori = db.Kategoriler.ToList().Select(x => new
              SelectListItem
            {
                Selected = false,
                Text = x.Tanim,
                Value = x.Id.ToString()


            }).ToList();

            ViewBag.kategoriler = kategori;
            var varyant = db.Varyant.ToList().Select(x => new
             SelectListItem
            {
                Selected = false,
                Text = x.Tanim,
                Value = x.Id.ToString()


            }).ToList();
            ViewBag.varyant = varyant;

            var urun = db.Urunler.Where(x => x.Id == id).FirstOrDefault();



            return View(urun);

        }

        [HttpPost]
        public ActionResult guncelle(Urunler data,HttpPostedFileBase file)
        {
            



            var guncelurun = db.Urunler.Where(x => x.Id == data.Id).FirstOrDefault();

            if (file!=null)
            {
                if (file.ContentLength > 0)
                {

                    string uzanti = Path.GetExtension(Request.Files[0].FileName);

                    string resimadi = Guid.NewGuid() + uzanti;
                    string kok = Path.Combine(Server.MapPath("/Content/images/"), resimadi);

                    using (var stream = new FileStream(kok, FileMode.Create))
                    {
                        file.InputStream.CopyTo(stream);

                    }

                    file.SaveAs(kok);

                    guncelurun.Resim = resimadi;

                }
            }
           
            else
            {
                guncelurun.Adi = data.Adi;
                guncelurun.Adet = data.Adet;
                guncelurun.Aciklama = data.Aciklama;
                guncelurun.fiyat = data.fiyat;
                guncelurun.KategoriID = data.KategoriID;
                guncelurun.Stok_Kodu = data.Stok_Kodu;
            }
            
              

            


           


            int sonuc = db.SaveChanges();
            return RedirectToAction("liste");

        }

        public ActionResult test()
        {
            return View();
        }



    }
}
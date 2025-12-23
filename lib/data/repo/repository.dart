import 'package:to_do_app/data/entity/kayitlar.dart';
import 'package:to_do_app/sqlite/veritabaniYardimcisi.dart';

class Repository {
  Future<void> kaydet(String baslik,String gorev) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniGorev= Map<String,dynamic>();
    yeniGorev["baslik"]= baslik;
    yeniGorev["gorev"]=gorev;
    await db.insert("kayitlar", yeniGorev);
  }
  Future<void> guncelle(int id,String baslik,String gorev) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenGorev= Map<String,dynamic>();
    guncellenenGorev["baslik"]= baslik;
    guncellenenGorev["gorev"]=gorev;
    await db.update("kayitlar", guncellenenGorev,where: "id = ?",whereArgs: [id]);
  }
  Future<void> sil (int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("kayitlar",where: "id = ?",whereArgs: [id]);
  }
  Future<List<Kayitlar>> gorevleriYukle() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kayitlar");

    return List.generate(maps.length, (i){
      var satir=maps[i];
      return Kayitlar(id: satir["id"], baslik: satir["baslik"], gorev: satir["gorev"]);
    });
  }
  Future<List<Kayitlar>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kayitlar WHERE baslik or gorev like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kayitlar(id: satir["id"], baslik: satir["baslik"], gorev: satir["gorev"]);
    });
  }
}

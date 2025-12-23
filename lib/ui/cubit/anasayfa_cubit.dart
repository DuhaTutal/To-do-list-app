import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/kayitlar.dart';
import 'package:to_do_app/data/repo/repository.dart';

class AnasayfaCubit extends Cubit<List<Kayitlar>> {
  AnasayfaCubit():super(<Kayitlar>[]);

  var repo = Repository();

  Future<void> gorevleriYukle() async {
    var liste = await repo.gorevleriYukle();
    emit(liste);
  }

  Future<void> ara (String aramaKelimesi) async {
    var liste = await repo.ara(aramaKelimesi);
    emit(liste);
  }
  Future<void> sil(int id) async {
    await repo.sil(id);
    await repo.gorevleriYukle();
  }
}
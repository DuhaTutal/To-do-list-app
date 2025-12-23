import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/repository.dart';

class GuncellemeSayfaCubit extends Cubit<void>{
  GuncellemeSayfaCubit():super(0);

  var repo =Repository();

  Future<void> guncelle(int id, String baslik,String gorev) async{
    await repo.guncelle(id, baslik, gorev);
  }
}
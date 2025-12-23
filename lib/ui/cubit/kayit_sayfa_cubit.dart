import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var repo = Repository();

  Future<void> kaydet(String baslik,String gorev) async{
    await repo.kaydet(baslik, gorev);
  }
}
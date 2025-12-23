import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/kayitlar.dart';
import 'package:to_do_app/ui/cubit/guncelleme_sayfa_cubit.dart';

class GuncellemeSayfa extends StatefulWidget {
  final Kayitlar kayit;
  const GuncellemeSayfa({super.key,required this.kayit});

  @override
  State<GuncellemeSayfa> createState() => _GuncellemeSayfaState();
}
class _GuncellemeSayfaState extends State<GuncellemeSayfa> {
  var tfBaslik = TextEditingController();
  var tfGorev = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kayit = widget.kayit;
    tfBaslik.text = kayit.baslik;
    tfGorev.text = kayit.gorev;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFBB86FC)),
        backgroundColor: Color(0xFF121212), title:  Text(widget.kayit.baslik,style: TextStyle(color: Color(0xFFE0E0E0),fontWeight: FontWeight.bold),),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfBaslik,
                cursorColor: const Color(0xFFE0E0E0),
                style: const TextStyle(
                    color: Color(0xFFE0E0E0),
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                  labelText: "Başlık",
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelStyle: const TextStyle(
                      color: Color(0xFF627EEA),
                      fontWeight: FontWeight.bold
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF627EEA), width: 2.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
        TextField(
          controller: tfGorev,
          cursorColor: const Color(0xFFE0E0E0),
          style: const TextStyle(
              color: Color(0xFFE0E0E0),
              fontSize: 16,
              fontWeight: FontWeight.normal
          ),
          decoration: InputDecoration(
            labelText: "Görev",
            labelStyle: const TextStyle(color: Colors.grey),
            floatingLabelStyle: const TextStyle(
                color: Color(0xFF627EEA),
                fontWeight: FontWeight.bold
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF627EEA), width: 2.5),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
              ElevatedButton(onPressed: (){
                context.read<GuncellemeSayfaCubit>().guncelle(widget.kayit.id, tfBaslik.text, tfGorev.text);
              }, child: const Text("Güncelle"),style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFFBB86FC),
                  foregroundColor:  Color(0xFFE0E0E0)
              ))
            ],
          ),
        ),
      ),
    );
  }
}

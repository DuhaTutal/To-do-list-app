import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfBaslik = TextEditingController();
  var tfGorev = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFBB86FC)),
        backgroundColor: Color(0xFF121212),
        title: Text("Yeni Görev",style: TextStyle(color: Color(0xFFE0E0E0),fontWeight: FontWeight.bold),),),
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
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                  labelText: "Başlık",
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  floatingLabelStyle: const TextStyle(
                      color: Color(0xFF627EEA),
                      fontWeight: FontWeight.bold
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCFD8DC)),
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
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  floatingLabelStyle: const TextStyle(
                      color: Color(0xFF627EEA),
                      fontWeight: FontWeight.bold
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCFD8DC)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF627EEA), width: 2.5),
                  ),

                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfBaslik.text, tfGorev.text);
              }, child: const Text("Kaydet"),style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFFBB86FC),
                foregroundColor:  Color(0xFFE0E0E0)
              ),)
            ],
          ),
        ),
      ),
    );
  }
}

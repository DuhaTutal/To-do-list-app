import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/kayitlar.dart';
import 'package:to_do_app/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/views/guncelleme_sayfa.dart';
import 'package:to_do_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu =false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().gorevleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF121212),
      appBar: AppBar(backgroundColor: Color(0xFF121212),
        elevation: 0,
        title: aramaYapiliyorMu ?
        TextField(
          style: TextStyle(color: Color(0xFFE0E0E0) ),
          decoration: const InputDecoration(
              labelText: "Ara",
              labelStyle: TextStyle(
                color: Color(0xFFE0E0E0),)),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ) :
            const Text("GÖREVLER",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFE0E0E0)),),
        actions: [
          aramaYapiliyorMu ? IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().gorevleriYukle();
          }, icon: const Icon(Icons.clear)) :
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyorMu = true;
                });
              }, icon: const Icon(Icons.search,color: Color(0xFFBB86FC),))
        ],
        ),
      body: BlocBuilder<AnasayfaCubit,List<Kayitlar>>(
      builder: (context,kayitListesi){
        if(kayitListesi.isNotEmpty){
          return ListView.builder(
              itemCount: kayitListesi.length,
              itemBuilder: (context,indeks){
                var kayit =kayitListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GuncellemeSayfa(kayit: kayit)))
                        .then((value){
                          context.read<AnasayfaCubit>().gorevleriYukle();
                    });
                  },
                  child: Card(color: Color(0xFF1E1E1E),
                    child: SizedBox(height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kayit.baslik,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFE0E0E0)),
                                ),
                                Text(
                                  kayit.gorev,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Color(0xFFE0E0E0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${kayit.baslik} silinsin mi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: () {
                                    context.read<AnasayfaCubit>().sil(kayit.id);
                                    context.read<AnasayfaCubit>().gorevleriYukle();
                                  },
                                ),
                              ));
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Color(0xFFBB86FC),
                            )),
                      ],
                    )
                    ),
                  ),
                );

              });
        }else{
          return const Center();
        }
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            context.read<AnasayfaCubit>().gorevleriYukle();
          });
        },
        child: const Icon(Icons.add,color: Color(0xFFBB86FC),),
      ),
    );
  }
}

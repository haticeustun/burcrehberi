import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/%20utils/string.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burç rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }

    return burclar;
  }
  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }




Widget tekSatirBurc(BuildContext context, int index) {
  Burc oanListeyeEklenenBurc = tumBurclar[index];

  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + oanListeyeEklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            oanListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
        ),
        subtitle:  Text(
          oanListeyeEklenenBurc.burcTarihi,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black38),
        ),
        trailing: Icon(Icons.arrow_forward_ios,  color: Colors.pink,),
      ),
    ),
  );
}
}

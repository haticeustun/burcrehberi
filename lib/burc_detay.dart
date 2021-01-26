import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:google_fonts/google_fonts.dart';

class BurcDetay extends StatelessWidget {
  int gelenIndex;
  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenIndex];

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            // backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri",
                  style: GoogleFonts.oswald(fontSize: 24)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              // color: Colors.pink.shade100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      secilenBurc.burcDetayi.trim(),
                      style: GoogleFonts.oswald(fontSize: 24),
                    ),
                    Text(
                      secilenBurc.burcDetayi.trim(),
                      style: GoogleFonts.oswald(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

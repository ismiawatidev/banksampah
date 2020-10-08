import 'package:flutter/material.dart';

class SetorLangsung extends StatefulWidget {
  @override
  _SetorLangsungState createState() => _SetorLangsungState();
}

class _SetorLangsungState extends State<SetorLangsung> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SETOR LANGSUNG",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "img/perbaikan.png",
                height: 200,
              ),
              SizedBox(height: 15),
              Text(
                "Kita lagi nyiapin sesuatu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Sabar ya, ini semua biar kamu bisa nikmatin berbagai layanan terbaik di MyTrash.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:banksampah/custom/transferList.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TRANSFER",
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                height: 40,
                width: double.infinity,
                color: Colors.grey[200],
                child: Text(
                  "Pilih Bank Tujuan",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          print("bank-bri");
                        },
                        child: TransferList(
                          namabank: "Bank BRI",
                          logobank: "img/bank-bri.png",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("bank-bni");
                        },
                        child: TransferList(
                          namabank: "Bank BNI",
                          logobank: "img/bank-bni.png",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("bank-mandiri");
                        },
                        child: TransferList(
                          namabank: "Bank Mandiri",
                          logobank: "img/bank-mandiri.png",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:banksampah/cache/sharePref.dart';
import 'package:banksampah/models/index.dart';
import 'package:banksampah/screen/jenisSampah/botolKaca.dart';
import 'package:banksampah/screen/jenisSampah/botolPlastik.dart';
import 'package:banksampah/screen/jenisSampah/kardus.dart';
import 'package:banksampah/screen/jenisSampah/kertas.dart';
import 'package:banksampah/screen/menu/notifikasi.dart';
import 'package:banksampah/screen/menu/profile.dart';
import 'package:banksampah/screen/menu/riwayat.dart';
import 'package:banksampah/screen/menu/transfer.dart';
import 'package:banksampah/screen/setor/jemputSampah.dart';
import 'package:banksampah/screen/setor/setorLangsung.dart';
import 'package:banksampah/themes/myClipper.dart';
import 'package:banksampah/themes/myColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  userCheck() async {
    pref.getUserInfo().then((value) {
      setState(() {
        userModel = value;
      });
    });
  }

  PostResult userModel;
  Pref pref = Pref();

  final price = NumberFormat("#,##0", 'en_US');

  Future<void> onRefresh() async {
    userCheck();
  }

  @override
  void initState() {
    super.initState();
    userCheck();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "img/mytrash.png",
            height: 40,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                "img/notification-red.png",
                height: 24,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifikasi()));
                print("Notifikasi");
              },
            ),
            IconButton(
              icon: Image.asset(
                "img/user.png",
                color: Colors.white,
                height: 24,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (contex) => Profile()));
                print("Profile");
              },
            ),
          ],
          backgroundColor: MyColors.primary,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [MyColors.primary, Colors.green],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "MyTrash Saldo",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          userModel == null
                              ? "Rp. 0"
                              : "Rp. ${userModel.saldo}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print("Setor sampah");
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Setor Sampah",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  JemputSampah()));
                                                      print("jemput sampah");
                                                    },
                                                    child: Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                Offset(0, 2),
                                                            blurRadius: 10,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "img/pick-up-truck.png",
                                                            height: 45,
                                                          ),
                                                          SizedBox(height: 8),
                                                          Text(
                                                            "Jemput Sampah",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SetorLangsung()));
                                                      print("setor langung");
                                                    },
                                                    child: Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                Offset(0, 2),
                                                            blurRadius: 10,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "img/cargo-box.png",
                                                            height: 45,
                                                          ),
                                                          SizedBox(height: 8),
                                                          Text(
                                                            "Setor Langsung",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: Image.asset(
                                      "img/bag.png",
                                      color: MyColors.primary,
                                    ),
                                  ),
                                  Text(
                                    "Setor",
                                    style: TextStyle(
                                      color: MyColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "img/transfer.png",
                                      color: MyColors.primary,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Transfer()));
                                      print("Transfer");
                                    },
                                  ),
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                      color: MyColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      "img/history.png",
                                      color: MyColors.primary,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Riwayat()));
                                      print("History");
                                    },
                                  ),
                                  Text(
                                    "Riwayat",
                                    style: TextStyle(
                                      color: MyColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Jenis Sampah",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BotolKaca()));
                            print("Botol Kaca");
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "img/tomato-sauce.png",
                                      height: 90,
                                    ),
                                    SizedBox(width: 18),
                                    Container(
                                      width: 225,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Botol Kaca",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Kaca dapat didaur ulang dan menghemat sumber daya energi yang baru. Membuat produk dari kaca daur ulang menggunakan ...",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BotolPlastik()));
                            print("Botol Plastik");
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "img/plastic-bottle.png",
                                      height: 90,
                                    ),
                                    SizedBox(width: 18),
                                    Container(
                                      width: 225,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Botol Plastik",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Plastik memiliki efek yang merusak lingkungan karena sulit untuk membusuk secara alami. Diperkirakan, butuh sekitar ...",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Kertas()));
                            print("Kertas");
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "img/newspaper.png",
                                      height: 90,
                                    ),
                                    SizedBox(width: 18),
                                    Container(
                                      width: 225,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kertas",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Kertas berbahan dasar kayu akan merugikan dan mempengaruhi kelestarian hutan. Jika kertas didaur ulang, setidaknya ...",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Kardus()));
                            print("Kardus");
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "img/box.png",
                                      height: 90,
                                    ),
                                    SizedBox(width: 18),
                                    Container(
                                      width: 225,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kardus",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Kardus yang didaur ulang dapat berguna untuk kemudian dijadikan bubur kertas lagi dan dibuat menjadi kardus baru, sehingga ...",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

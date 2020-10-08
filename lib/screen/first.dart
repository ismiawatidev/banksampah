import 'package:banksampah/cache/sharePref.dart';
import 'package:banksampah/screen/login.dart';
import 'package:banksampah/screen/mainMenu.dart';
import 'package:banksampah/themes/myColors.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  Pref pref = Pref();
  // cekLogin() {
  //   pref.cekLogin().then((value) {
  //     if (value == null) {
  //       sessionSignOut();
  //     } else {
  //       sessionSignIn();
  //     }
  //   });
  // }

  sessionSignIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainMenu()));
  }

  sessionSignOut() {}

  @override
  void initState() {
    super.initState();
    // cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "img/mytrash.png",
                  height: 70,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Selamat datang di MyTrash",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.primary),
                    child: Text(
                      "Masuk",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:banksampah/cache/sharePref.dart';
import 'package:banksampah/screen/mainMenu.dart';
import 'package:banksampah/services/servicesAuth.dart';
import 'package:banksampah/themes/myColors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StreamController<bool> obSecure;
  final _key = GlobalKey<FormState>();

  login() async {
    if (_key.currentState.validate()) {
      submit();
    }
  }

  Pref pref = Pref();
  submit() async {
    ServicesAuth.login(noHp.text.trim(), password.text.trim()).then((value) {
      if (value.value == 1) {
        setState(() {
          pref.updatePrefLogin(
            value.noHp,
            value.noRekening,
            value.id,
            value.nama,
            value.alamat,
            value.tgl,
            value.saldo,
          );
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainMenu()));
        print("Login berhasil");
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Peringatan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text("${value.message}"),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border(
                        top: BorderSide(
                          width: 0.6,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Ok",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }

  TextEditingController noHp = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    obSecure = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80),
                Text(
                  "Selamat datang!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Masuk dengan nomor telpon anda untuk memulai",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 50,
                ),
                StreamBuilder(
                  initialData: TextEditingController(),
                  builder: (context, snapshot) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 6, top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: noHp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Nomor HP",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                noHp.clear();
                              },
                              child: Icon(Icons.close))
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                StreamBuilder(
                  stream: obSecure.stream,
                  initialData: true,
                  builder: (context, snapshot) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, bottom: 6, top: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: password,
                              obscureText: snapshot.data,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                if (snapshot.data == true) {
                                  obSecure.add(false);
                                } else {
                                  obSecure.add(true);
                                }
                              },
                              child: Icon(snapshot.data
                                  ? Icons.visibility_off
                                  : Icons.visibility))
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    login();
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
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

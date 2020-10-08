import 'package:banksampah/cache/sharePref.dart';
import 'package:banksampah/models/index.dart';
import 'package:banksampah/screen/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../login.dart';

class Profile extends StatefulWidget {
  final Function signOut;

  const Profile({Key key, this.signOut}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String currentVersion;
  versionCheck() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    currentVersion = info.version.trim();
    pref.getUserInfo().then((value) {
      setState(() {
        userModel = value;
      });
    });
  }

  PostResult userModel;
  Pref pref = Pref();

  signOut() {
    pref.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      ModalRoute.withName('/'),
    );
  }

  @override
  void initState() {
    super.initState();
    versionCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainMenu()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "PROFILE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "img/users.jpg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel == null ? "" : "${userModel.nama}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userModel == null ? "" : "${userModel.noRekening}",
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 10,
            color: Colors.grey[200],
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Text(
                  "Akun",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Ubah profile");
                },
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset(
                            "img/edit.png",
                            color: Colors.grey,
                            height: 25,
                          ),
                          title: Text(
                            "Ubah Profile",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey[200],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Text(
                  "Tentang",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("syarat dan ketentuan");
                },
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset(
                            "img/accept.png",
                            color: Colors.grey,
                            height: 25,
                          ),
                          title: Text(
                            "Syarat dan Ketentuan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
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
                  print("kebijakan privasi");
                },
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset(
                            "img/privacy-policy.png",
                            color: Colors.grey,
                            height: 25,
                          ),
                          title: Text(
                            "Kebijakan Privasi",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
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
                  print("pusat bantuan");
                },
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset(
                            "img/contact.png",
                            color: Colors.grey,
                            height: 25,
                          ),
                          title: Text(
                            "Pusat Bantuan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.grey[200],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Version $currentVersion",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "#sampahDadiDuit",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.all(0),
                                contentPadding: EdgeInsets.all(0),
                                title: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Keluar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                          "Apakah kamu yakin ingin keluar?"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            width: 0.6,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.pop(context),
                                            child: Text("Batal"),
                                          ),
                                          SizedBox(width: 30),
                                          InkWell(
                                            onTap: () {
                                              signOut();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.red[900],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                "Keluar",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red[900]),
                          child: Text(
                            "Keluar",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

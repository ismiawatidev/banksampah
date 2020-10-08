import 'package:flutter/material.dart';

class Kardus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "KARDUS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "img/kardus.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kardus",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp. 1.500",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      "Kardus yang didaur ulang dapat berguna untuk kemudian dijadikan bubur kertas lagi dan dibuat menjadi kardus baru, sehingga selain mengurangi sampah, kardus daur ulang juga dapat mengurangi pohon yang harus ditebang untuk membuat bubur kertas.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ada juga beberapa jenis kardus yang tidak bisa didaur ulang. Misalnya kotak bekas pizza atau makanan lainnya yang terkena minyak. Kardus seperti ini biasanya sudah tidak bisa lagi didaur ulang dan tidak berguna lagi.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Begitu juga kardus bekas wadah jus atau susu yang sudah basah yang tidak bisa didaur ulang lagi. Namun jangan khawatir. Kardus bekas makanan yang terkena minyak masih bisa digunakan untuk membuat kompos.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}

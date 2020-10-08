import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  final String namabank;
  final String logobank;

  const TransferList({Key key, this.namabank, this.logobank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$namabank",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Image.asset(
                "$logobank",
                height: 22,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:banksampah/models/index.dart';
import 'package:banksampah/network/network.dart';
import 'package:dio/dio.dart';

class ServicesAuth {
  static Future<PostResult> login(String noHp, String password) async {
    FormData formData = FormData.fromMap({
      "no_hp": noHp,
      "password": password,
    });
    Dio dio = new Dio();
    final response = await dio.post(NetworkUrl.login(), data: formData);
    print("${response.statusCode}");

    if (response.statusCode == 200) {
      print(response.data);
      PostResult postResult = PostResult.fromJson(jsonDecode(response.data));
      return postResult;
    } else {
      PostResult postResult = PostResult.fromJson(jsonDecode(response.data));
      return postResult;
    }
  }
}

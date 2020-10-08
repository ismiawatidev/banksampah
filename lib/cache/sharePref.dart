import 'package:banksampah/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static String noHp = "noHp";
  static String noRekening = "noRekening";
  static String id = "id";
  static String nama = "nama";
  static String alamat = "alamat";
  static String tgl = "tgl";
  static String saldo = "saldo";

  updatePrefLogin(
    String noHp,
    String noRekening,
    String id,
    String nama,
    String alamat,
    String tgl,
    String saldo,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Pref.noHp, noHp);
    pref.setString(Pref.noRekening, noRekening);
    pref.setString(Pref.id, id);
    pref.setString(Pref.nama, nama);
    pref.setString(Pref.alamat, alamat);
    pref.setString(Pref.tgl, tgl);
    pref.setString(Pref.saldo, saldo);
  }

  signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(Pref.noHp);
    pref.remove(Pref.noRekening);
    pref.remove(Pref.id);
    pref.remove(Pref.nama);
    pref.remove(Pref.alamat);
    pref.remove(Pref.tgl);
    pref.remove(Pref.saldo);
  }

  saldoUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Pref.saldo, saldo);
  }

  Future<PostResult> getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    PostResult post = PostResult();
    post.id = pref.getString(Pref.id);
    post.noRekening = pref.getString(Pref.noRekening);
    post.nama = pref.getString(Pref.nama);
    post.alamat = pref.getString(Pref.alamat);
    post.noHp = pref.getString(Pref.noHp);
    post.tgl = pref.getString(Pref.tgl);
    post.saldo = pref.getString(Pref.saldo);
    post.saldo = pref.getString(Pref.saldo);
    return post;
  }

  Future<String> cekLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Pref.id);
  }
}

import 'package:json_annotation/json_annotation.dart';


part 'postResult.g.dart';

@JsonSerializable()
class PostResult {
      PostResult();

  int value;
  String id;
  @JsonKey(name: 'no_rekening') String noRekening;
  String nama;
  String alamat;
  @JsonKey(name: 'no_hp') String noHp;
  String tgl;
  String saldo;
  String password;
  String status;
  String message;

  factory PostResult.fromJson(Map<String,dynamic> json) => _$PostResultFromJson(json);
  Map<String, dynamic> toJson() => _$PostResultToJson(this);
}

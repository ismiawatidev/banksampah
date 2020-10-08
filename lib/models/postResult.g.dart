// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResult _$PostResultFromJson(Map<String, dynamic> json) {
  return PostResult()
    ..value = json['value'] as int
    ..id = json['id'] as String
    ..noRekening = json['no_rekening'] as String
    ..nama = json['nama'] as String
    ..alamat = json['alamat'] as String
    ..noHp = json['no_hp'] as String
    ..tgl = json['tgl'] as String
    ..saldo = json['saldo'] as String
    ..password = json['password'] as String
    ..status = json['status'] as String
    ..message = json['message'] as String;
}

Map<String, dynamic> _$PostResultToJson(PostResult instance) =>
    <String, dynamic>{
      'value': instance.value,
      'id': instance.id,
      'no_rekening': instance.noRekening,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'no_hp': instance.noHp,
      'tgl': instance.tgl,
      'saldo': instance.saldo,
      'password': instance.password,
      'status': instance.status,
      'message': instance.message,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      r030: (json['r030'] as num).toInt(),
      txt: json['txt'] as String,
      rate: (json['rate'] as num).toDouble(),
      cc: json['cc'] as String,
      exchangedate: DateExt.fromJson(json['exchangedate'] as String?),
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'r030': instance.r030,
      'txt': instance.txt,
      'rate': instance.rate,
      'cc': instance.cc,
      'exchangedate': DateExt.toJson(instance.exchangedate),
    };

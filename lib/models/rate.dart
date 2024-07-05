import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_task_bank/utils/date_ext.dart';

part 'rate.g.dart';

@JsonSerializable()
class Rate extends Equatable {
  final int r030;
  final String txt;
  final double rate;
  final String cc;
  @JsonKey(fromJson: DateExt.fromJson, toJson: DateExt.toJson)
  final DateTime? exchangedate;

  const Rate({
    required this.r030,
    required this.txt,
    required this.rate,
    required this.cc,
    this.exchangedate,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return _$RateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RateToJson(this);

  @override
  List<Object?> get props {
    return [
      r030,
      txt,
      rate,
      cc,
      exchangedate,
    ];
  }
}

import 'package:json_annotation/json_annotation.dart';

class DoubleConverter implements JsonConverter<double, dynamic> {
  const DoubleConverter();

  @override
  double fromJson(dynamic json) {
    if (json == null) return 0.0;
    if (json is double) return json;
    if (json is int) return json.toDouble();
    return double.tryParse(json.toString()) ?? 0.0;
  }

  @override
  dynamic toJson(double object) => object;
}
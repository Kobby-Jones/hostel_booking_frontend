import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
abstract class Owner with _$Owner {
  const Owner._();

  const factory Owner({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? phone,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
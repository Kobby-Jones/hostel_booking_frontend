import 'package:freezed_annotation/freezed_annotation.dart';

part 'hostel_image.freezed.dart';
part 'hostel_image.g.dart';

@freezed
abstract class HostelImage with _$HostelImage {
  const HostelImage._();

  const factory HostelImage({
    required String id,
    required String url,
    required String key, // Prisma: String (S3 key)
    String? thumbnailUrl,
    String? caption,
    @Default(0) int displayOrder,
  }) = _HostelImage;

  factory HostelImage.fromJson(Map<String, dynamic> json) => _$HostelImageFromJson(json);
}
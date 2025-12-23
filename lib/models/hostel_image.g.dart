// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HostelImage _$HostelImageFromJson(Map<String, dynamic> json) => _HostelImage(
  id: json['id'] as String,
  url: json['url'] as String,
  key: json['key'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  caption: json['caption'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HostelImageToJson(_HostelImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'key': instance.key,
      'thumbnailUrl': instance.thumbnailUrl,
      'caption': instance.caption,
      'displayOrder': instance.displayOrder,
    };

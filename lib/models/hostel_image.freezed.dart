// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hostel_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HostelImage {

 String get id; String get url; String get key;// Prisma: String (S3 key)
 String? get thumbnailUrl; String? get caption; int get displayOrder;
/// Create a copy of HostelImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostelImageCopyWith<HostelImage> get copyWith => _$HostelImageCopyWithImpl<HostelImage>(this as HostelImage, _$identity);

  /// Serializes this HostelImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostelImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,key,thumbnailUrl,caption,displayOrder);

@override
String toString() {
  return 'HostelImage(id: $id, url: $url, key: $key, thumbnailUrl: $thumbnailUrl, caption: $caption, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class $HostelImageCopyWith<$Res>  {
  factory $HostelImageCopyWith(HostelImage value, $Res Function(HostelImage) _then) = _$HostelImageCopyWithImpl;
@useResult
$Res call({
 String id, String url, String key, String? thumbnailUrl, String? caption, int displayOrder
});




}
/// @nodoc
class _$HostelImageCopyWithImpl<$Res>
    implements $HostelImageCopyWith<$Res> {
  _$HostelImageCopyWithImpl(this._self, this._then);

  final HostelImage _self;
  final $Res Function(HostelImage) _then;

/// Create a copy of HostelImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? key = null,Object? thumbnailUrl = freezed,Object? caption = freezed,Object? displayOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HostelImage].
extension HostelImagePatterns on HostelImage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HostelImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HostelImage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HostelImage value)  $default,){
final _that = this;
switch (_that) {
case _HostelImage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HostelImage value)?  $default,){
final _that = this;
switch (_that) {
case _HostelImage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String key,  String? thumbnailUrl,  String? caption,  int displayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HostelImage() when $default != null:
return $default(_that.id,_that.url,_that.key,_that.thumbnailUrl,_that.caption,_that.displayOrder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String key,  String? thumbnailUrl,  String? caption,  int displayOrder)  $default,) {final _that = this;
switch (_that) {
case _HostelImage():
return $default(_that.id,_that.url,_that.key,_that.thumbnailUrl,_that.caption,_that.displayOrder);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String key,  String? thumbnailUrl,  String? caption,  int displayOrder)?  $default,) {final _that = this;
switch (_that) {
case _HostelImage() when $default != null:
return $default(_that.id,_that.url,_that.key,_that.thumbnailUrl,_that.caption,_that.displayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HostelImage extends HostelImage {
  const _HostelImage({required this.id, required this.url, required this.key, this.thumbnailUrl, this.caption, this.displayOrder = 0}): super._();
  factory _HostelImage.fromJson(Map<String, dynamic> json) => _$HostelImageFromJson(json);

@override final  String id;
@override final  String url;
@override final  String key;
// Prisma: String (S3 key)
@override final  String? thumbnailUrl;
@override final  String? caption;
@override@JsonKey() final  int displayOrder;

/// Create a copy of HostelImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HostelImageCopyWith<_HostelImage> get copyWith => __$HostelImageCopyWithImpl<_HostelImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HostelImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HostelImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,key,thumbnailUrl,caption,displayOrder);

@override
String toString() {
  return 'HostelImage(id: $id, url: $url, key: $key, thumbnailUrl: $thumbnailUrl, caption: $caption, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class _$HostelImageCopyWith<$Res> implements $HostelImageCopyWith<$Res> {
  factory _$HostelImageCopyWith(_HostelImage value, $Res Function(_HostelImage) _then) = __$HostelImageCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String key, String? thumbnailUrl, String? caption, int displayOrder
});




}
/// @nodoc
class __$HostelImageCopyWithImpl<$Res>
    implements _$HostelImageCopyWith<$Res> {
  __$HostelImageCopyWithImpl(this._self, this._then);

  final _HostelImage _self;
  final $Res Function(_HostelImage) _then;

/// Create a copy of HostelImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? key = null,Object? thumbnailUrl = freezed,Object? caption = freezed,Object? displayOrder = null,}) {
  return _then(_HostelImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

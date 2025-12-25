// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Room {

 String get id; String get roomNumber; String get title; String? get description; String get roomType; int get capacity;@DoubleConverter() double get pricePerNight;@DoubleConverter() double? get pricePerMonth; int? get floor; double? get size; List<String> get amenities; bool get isAvailable; Hostel? get hostel;
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCopyWith<Room> get copyWith => _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.pricePerMonth, pricePerMonth) || other.pricePerMonth == pricePerMonth)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.hostel, hostel) || other.hostel == hostel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,title,description,roomType,capacity,pricePerNight,pricePerMonth,floor,size,const DeepCollectionEquality().hash(amenities),isAvailable,hostel);

@override
String toString() {
  return 'Room(id: $id, roomNumber: $roomNumber, title: $title, description: $description, roomType: $roomType, capacity: $capacity, pricePerNight: $pricePerNight, pricePerMonth: $pricePerMonth, floor: $floor, size: $size, amenities: $amenities, isAvailable: $isAvailable, hostel: $hostel)';
}


}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res>  {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) = _$RoomCopyWithImpl;
@useResult
$Res call({
 String id, String roomNumber, String title, String? description, String roomType, int capacity,@DoubleConverter() double pricePerNight,@DoubleConverter() double? pricePerMonth, int? floor, double? size, List<String> amenities, bool isAvailable, Hostel? hostel
});


$HostelCopyWith<$Res>? get hostel;

}
/// @nodoc
class _$RoomCopyWithImpl<$Res>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomNumber = null,Object? title = null,Object? description = freezed,Object? roomType = null,Object? capacity = null,Object? pricePerNight = null,Object? pricePerMonth = freezed,Object? floor = freezed,Object? size = freezed,Object? amenities = null,Object? isAvailable = null,Object? hostel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,pricePerMonth: freezed == pricePerMonth ? _self.pricePerMonth : pricePerMonth // ignore: cast_nullable_to_non_nullable
as double?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double?,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,hostel: freezed == hostel ? _self.hostel : hostel // ignore: cast_nullable_to_non_nullable
as Hostel?,
  ));
}
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HostelCopyWith<$Res>? get hostel {
    if (_self.hostel == null) {
    return null;
  }

  return $HostelCopyWith<$Res>(_self.hostel!, (value) {
    return _then(_self.copyWith(hostel: value));
  });
}
}


/// Adds pattern-matching-related methods to [Room].
extension RoomPatterns on Room {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Room value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Room value)  $default,){
final _that = this;
switch (_that) {
case _Room():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Room value)?  $default,){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String roomNumber,  String title,  String? description,  String roomType,  int capacity, @DoubleConverter()  double pricePerNight, @DoubleConverter()  double? pricePerMonth,  int? floor,  double? size,  List<String> amenities,  bool isAvailable,  Hostel? hostel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomNumber,_that.title,_that.description,_that.roomType,_that.capacity,_that.pricePerNight,_that.pricePerMonth,_that.floor,_that.size,_that.amenities,_that.isAvailable,_that.hostel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String roomNumber,  String title,  String? description,  String roomType,  int capacity, @DoubleConverter()  double pricePerNight, @DoubleConverter()  double? pricePerMonth,  int? floor,  double? size,  List<String> amenities,  bool isAvailable,  Hostel? hostel)  $default,) {final _that = this;
switch (_that) {
case _Room():
return $default(_that.id,_that.roomNumber,_that.title,_that.description,_that.roomType,_that.capacity,_that.pricePerNight,_that.pricePerMonth,_that.floor,_that.size,_that.amenities,_that.isAvailable,_that.hostel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String roomNumber,  String title,  String? description,  String roomType,  int capacity, @DoubleConverter()  double pricePerNight, @DoubleConverter()  double? pricePerMonth,  int? floor,  double? size,  List<String> amenities,  bool isAvailable,  Hostel? hostel)?  $default,) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.roomNumber,_that.title,_that.description,_that.roomType,_that.capacity,_that.pricePerNight,_that.pricePerMonth,_that.floor,_that.size,_that.amenities,_that.isAvailable,_that.hostel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Room extends Room {
  const _Room({required this.id, required this.roomNumber, this.title = "Standard Room", this.description, required this.roomType, required this.capacity, @DoubleConverter() required this.pricePerNight, @DoubleConverter() this.pricePerMonth, this.floor, this.size, final  List<String> amenities = const [], this.isAvailable = true, this.hostel}): _amenities = amenities,super._();
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

@override final  String id;
@override final  String roomNumber;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String roomType;
@override final  int capacity;
@override@DoubleConverter() final  double pricePerNight;
@override@DoubleConverter() final  double? pricePerMonth;
@override final  int? floor;
@override final  double? size;
 final  List<String> _amenities;
@override@JsonKey() List<String> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

@override@JsonKey() final  bool isAvailable;
@override final  Hostel? hostel;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCopyWith<_Room> get copyWith => __$RoomCopyWithImpl<_Room>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room&&(identical(other.id, id) || other.id == id)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.pricePerMonth, pricePerMonth) || other.pricePerMonth == pricePerMonth)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.hostel, hostel) || other.hostel == hostel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomNumber,title,description,roomType,capacity,pricePerNight,pricePerMonth,floor,size,const DeepCollectionEquality().hash(_amenities),isAvailable,hostel);

@override
String toString() {
  return 'Room(id: $id, roomNumber: $roomNumber, title: $title, description: $description, roomType: $roomType, capacity: $capacity, pricePerNight: $pricePerNight, pricePerMonth: $pricePerMonth, floor: $floor, size: $size, amenities: $amenities, isAvailable: $isAvailable, hostel: $hostel)';
}


}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) = __$RoomCopyWithImpl;
@override @useResult
$Res call({
 String id, String roomNumber, String title, String? description, String roomType, int capacity,@DoubleConverter() double pricePerNight,@DoubleConverter() double? pricePerMonth, int? floor, double? size, List<String> amenities, bool isAvailable, Hostel? hostel
});


@override $HostelCopyWith<$Res>? get hostel;

}
/// @nodoc
class __$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomNumber = null,Object? title = null,Object? description = freezed,Object? roomType = null,Object? capacity = null,Object? pricePerNight = null,Object? pricePerMonth = freezed,Object? floor = freezed,Object? size = freezed,Object? amenities = null,Object? isAvailable = null,Object? hostel = freezed,}) {
  return _then(_Room(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,pricePerMonth: freezed == pricePerMonth ? _self.pricePerMonth : pricePerMonth // ignore: cast_nullable_to_non_nullable
as double?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double?,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,hostel: freezed == hostel ? _self.hostel : hostel // ignore: cast_nullable_to_non_nullable
as Hostel?,
  ));
}

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HostelCopyWith<$Res>? get hostel {
    if (_self.hostel == null) {
    return null;
  }

  return $HostelCopyWith<$Res>(_self.hostel!, (value) {
    return _then(_self.copyWith(hostel: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Booking {

 String get id; String? get bookingCode; String get status; DateTime get checkInDate; DateTime get checkOutDate; int get numberOfNights; int get numberOfGuests;@DoubleConverter() double get totalAmount; String? get specialRequests;// Change: Ensure nested objects are nullable to prevent 'type Null' errors
 Room? get room;
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCopyWith<Booking> get copyWith => _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.numberOfNights, numberOfNights) || other.numberOfNights == numberOfNights)&&(identical(other.numberOfGuests, numberOfGuests) || other.numberOfGuests == numberOfGuests)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests)&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingCode,status,checkInDate,checkOutDate,numberOfNights,numberOfGuests,totalAmount,specialRequests,room);

@override
String toString() {
  return 'Booking(id: $id, bookingCode: $bookingCode, status: $status, checkInDate: $checkInDate, checkOutDate: $checkOutDate, numberOfNights: $numberOfNights, numberOfGuests: $numberOfGuests, totalAmount: $totalAmount, specialRequests: $specialRequests, room: $room)';
}


}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res>  {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) = _$BookingCopyWithImpl;
@useResult
$Res call({
 String id, String? bookingCode, String status, DateTime checkInDate, DateTime checkOutDate, int numberOfNights, int numberOfGuests,@DoubleConverter() double totalAmount, String? specialRequests, Room? room
});


$RoomCopyWith<$Res>? get room;

}
/// @nodoc
class _$BookingCopyWithImpl<$Res>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingCode = freezed,Object? status = null,Object? checkInDate = null,Object? checkOutDate = null,Object? numberOfNights = null,Object? numberOfGuests = null,Object? totalAmount = null,Object? specialRequests = freezed,Object? room = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingCode: freezed == bookingCode ? _self.bookingCode : bookingCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as DateTime,numberOfNights: null == numberOfNights ? _self.numberOfNights : numberOfNights // ignore: cast_nullable_to_non_nullable
as int,numberOfGuests: null == numberOfGuests ? _self.numberOfGuests : numberOfGuests // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,specialRequests: freezed == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room?,
  ));
}
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res>? get room {
    if (_self.room == null) {
    return null;
  }

  return $RoomCopyWith<$Res>(_self.room!, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [Booking].
extension BookingPatterns on Booking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Booking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Booking value)  $default,){
final _that = this;
switch (_that) {
case _Booking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Booking value)?  $default,){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? bookingCode,  String status,  DateTime checkInDate,  DateTime checkOutDate,  int numberOfNights,  int numberOfGuests, @DoubleConverter()  double totalAmount,  String? specialRequests,  Room? room)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.bookingCode,_that.status,_that.checkInDate,_that.checkOutDate,_that.numberOfNights,_that.numberOfGuests,_that.totalAmount,_that.specialRequests,_that.room);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? bookingCode,  String status,  DateTime checkInDate,  DateTime checkOutDate,  int numberOfNights,  int numberOfGuests, @DoubleConverter()  double totalAmount,  String? specialRequests,  Room? room)  $default,) {final _that = this;
switch (_that) {
case _Booking():
return $default(_that.id,_that.bookingCode,_that.status,_that.checkInDate,_that.checkOutDate,_that.numberOfNights,_that.numberOfGuests,_that.totalAmount,_that.specialRequests,_that.room);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? bookingCode,  String status,  DateTime checkInDate,  DateTime checkOutDate,  int numberOfNights,  int numberOfGuests, @DoubleConverter()  double totalAmount,  String? specialRequests,  Room? room)?  $default,) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.bookingCode,_that.status,_that.checkInDate,_that.checkOutDate,_that.numberOfNights,_that.numberOfGuests,_that.totalAmount,_that.specialRequests,_that.room);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Booking extends Booking {
  const _Booking({required this.id, this.bookingCode, required this.status, required this.checkInDate, required this.checkOutDate, required this.numberOfNights, required this.numberOfGuests, @DoubleConverter() required this.totalAmount, this.specialRequests, this.room}): super._();
  factory _Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

@override final  String id;
@override final  String? bookingCode;
@override final  String status;
@override final  DateTime checkInDate;
@override final  DateTime checkOutDate;
@override final  int numberOfNights;
@override final  int numberOfGuests;
@override@DoubleConverter() final  double totalAmount;
@override final  String? specialRequests;
// Change: Ensure nested objects are nullable to prevent 'type Null' errors
@override final  Room? room;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCopyWith<_Booking> get copyWith => __$BookingCopyWithImpl<_Booking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingCode, bookingCode) || other.bookingCode == bookingCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.checkOutDate, checkOutDate) || other.checkOutDate == checkOutDate)&&(identical(other.numberOfNights, numberOfNights) || other.numberOfNights == numberOfNights)&&(identical(other.numberOfGuests, numberOfGuests) || other.numberOfGuests == numberOfGuests)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.specialRequests, specialRequests) || other.specialRequests == specialRequests)&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookingCode,status,checkInDate,checkOutDate,numberOfNights,numberOfGuests,totalAmount,specialRequests,room);

@override
String toString() {
  return 'Booking(id: $id, bookingCode: $bookingCode, status: $status, checkInDate: $checkInDate, checkOutDate: $checkOutDate, numberOfNights: $numberOfNights, numberOfGuests: $numberOfGuests, totalAmount: $totalAmount, specialRequests: $specialRequests, room: $room)';
}


}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) = __$BookingCopyWithImpl;
@override @useResult
$Res call({
 String id, String? bookingCode, String status, DateTime checkInDate, DateTime checkOutDate, int numberOfNights, int numberOfGuests,@DoubleConverter() double totalAmount, String? specialRequests, Room? room
});


@override $RoomCopyWith<$Res>? get room;

}
/// @nodoc
class __$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingCode = freezed,Object? status = null,Object? checkInDate = null,Object? checkOutDate = null,Object? numberOfNights = null,Object? numberOfGuests = null,Object? totalAmount = null,Object? specialRequests = freezed,Object? room = freezed,}) {
  return _then(_Booking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingCode: freezed == bookingCode ? _self.bookingCode : bookingCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutDate: null == checkOutDate ? _self.checkOutDate : checkOutDate // ignore: cast_nullable_to_non_nullable
as DateTime,numberOfNights: null == numberOfNights ? _self.numberOfNights : numberOfNights // ignore: cast_nullable_to_non_nullable
as int,numberOfGuests: null == numberOfGuests ? _self.numberOfGuests : numberOfGuests // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,specialRequests: freezed == specialRequests ? _self.specialRequests : specialRequests // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room?,
  ));
}

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res>? get room {
    if (_self.room == null) {
    return null;
  }

  return $RoomCopyWith<$Res>(_self.room!, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on

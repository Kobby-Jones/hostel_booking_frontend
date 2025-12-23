// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hostel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hostel {

 String get id; String get name; String get description; String get address; String get city; String get state; String get country; double? get latitude; double? get longitude; double? get distanceFromCampus; String get contactPhone; String? get contactEmail; List<String> get amenities; String? get rules; String? get checkInTime; String? get checkOutTime; String get status; bool get isActive; Owner get owner; List<Room> get rooms; List<HostelImage> get images;
/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostelCopyWith<Hostel> get copyWith => _$HostelCopyWithImpl<Hostel>(this as Hostel, _$identity);

  /// Serializes this Hostel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hostel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceFromCampus, distanceFromCampus) || other.distanceFromCampus == distanceFromCampus)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.rooms, rooms)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,city,state,country,latitude,longitude,distanceFromCampus,contactPhone,contactEmail,const DeepCollectionEquality().hash(amenities),rules,checkInTime,checkOutTime,status,isActive,owner,const DeepCollectionEquality().hash(rooms),const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'Hostel(id: $id, name: $name, description: $description, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceFromCampus: $distanceFromCampus, contactPhone: $contactPhone, contactEmail: $contactEmail, amenities: $amenities, rules: $rules, checkInTime: $checkInTime, checkOutTime: $checkOutTime, status: $status, isActive: $isActive, owner: $owner, rooms: $rooms, images: $images)';
}


}

/// @nodoc
abstract mixin class $HostelCopyWith<$Res>  {
  factory $HostelCopyWith(Hostel value, $Res Function(Hostel) _then) = _$HostelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String address, String city, String state, String country, double? latitude, double? longitude, double? distanceFromCampus, String contactPhone, String? contactEmail, List<String> amenities, String? rules, String? checkInTime, String? checkOutTime, String status, bool isActive, Owner owner, List<Room> rooms, List<HostelImage> images
});


$OwnerCopyWith<$Res> get owner;

}
/// @nodoc
class _$HostelCopyWithImpl<$Res>
    implements $HostelCopyWith<$Res> {
  _$HostelCopyWithImpl(this._self, this._then);

  final Hostel _self;
  final $Res Function(Hostel) _then;

/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? latitude = freezed,Object? longitude = freezed,Object? distanceFromCampus = freezed,Object? contactPhone = null,Object? contactEmail = freezed,Object? amenities = null,Object? rules = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? status = null,Object? isActive = null,Object? owner = null,Object? rooms = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceFromCampus: freezed == distanceFromCampus ? _self.distanceFromCampus : distanceFromCampus // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,rules: freezed == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as Owner,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<HostelImage>,
  ));
}
/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerCopyWith<$Res> get owner {
  
  return $OwnerCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hostel].
extension HostelPatterns on Hostel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hostel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hostel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hostel value)  $default,){
final _that = this;
switch (_that) {
case _Hostel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hostel value)?  $default,){
final _that = this;
switch (_that) {
case _Hostel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String address,  String city,  String state,  String country,  double? latitude,  double? longitude,  double? distanceFromCampus,  String contactPhone,  String? contactEmail,  List<String> amenities,  String? rules,  String? checkInTime,  String? checkOutTime,  String status,  bool isActive,  Owner owner,  List<Room> rooms,  List<HostelImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hostel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceFromCampus,_that.contactPhone,_that.contactEmail,_that.amenities,_that.rules,_that.checkInTime,_that.checkOutTime,_that.status,_that.isActive,_that.owner,_that.rooms,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String address,  String city,  String state,  String country,  double? latitude,  double? longitude,  double? distanceFromCampus,  String contactPhone,  String? contactEmail,  List<String> amenities,  String? rules,  String? checkInTime,  String? checkOutTime,  String status,  bool isActive,  Owner owner,  List<Room> rooms,  List<HostelImage> images)  $default,) {final _that = this;
switch (_that) {
case _Hostel():
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceFromCampus,_that.contactPhone,_that.contactEmail,_that.amenities,_that.rules,_that.checkInTime,_that.checkOutTime,_that.status,_that.isActive,_that.owner,_that.rooms,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String address,  String city,  String state,  String country,  double? latitude,  double? longitude,  double? distanceFromCampus,  String contactPhone,  String? contactEmail,  List<String> amenities,  String? rules,  String? checkInTime,  String? checkOutTime,  String status,  bool isActive,  Owner owner,  List<Room> rooms,  List<HostelImage> images)?  $default,) {final _that = this;
switch (_that) {
case _Hostel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceFromCampus,_that.contactPhone,_that.contactEmail,_that.amenities,_that.rules,_that.checkInTime,_that.checkOutTime,_that.status,_that.isActive,_that.owner,_that.rooms,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hostel extends Hostel {
  const _Hostel({required this.id, required this.name, required this.description, required this.address, required this.city, required this.state, this.country = "Ghana", this.latitude, this.longitude, this.distanceFromCampus, required this.contactPhone, this.contactEmail, final  List<String> amenities = const [], this.rules, this.checkInTime, this.checkOutTime, required this.status, this.isActive = true, required this.owner, final  List<Room> rooms = const [], final  List<HostelImage> images = const []}): _amenities = amenities,_rooms = rooms,_images = images,super._();
  factory _Hostel.fromJson(Map<String, dynamic> json) => _$HostelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String address;
@override final  String city;
@override final  String state;
@override@JsonKey() final  String country;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceFromCampus;
@override final  String contactPhone;
@override final  String? contactEmail;
 final  List<String> _amenities;
@override@JsonKey() List<String> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

@override final  String? rules;
@override final  String? checkInTime;
@override final  String? checkOutTime;
@override final  String status;
@override@JsonKey() final  bool isActive;
@override final  Owner owner;
 final  List<Room> _rooms;
@override@JsonKey() List<Room> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

 final  List<HostelImage> _images;
@override@JsonKey() List<HostelImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HostelCopyWith<_Hostel> get copyWith => __$HostelCopyWithImpl<_Hostel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HostelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hostel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceFromCampus, distanceFromCampus) || other.distanceFromCampus == distanceFromCampus)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._rooms, _rooms)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,city,state,country,latitude,longitude,distanceFromCampus,contactPhone,contactEmail,const DeepCollectionEquality().hash(_amenities),rules,checkInTime,checkOutTime,status,isActive,owner,const DeepCollectionEquality().hash(_rooms),const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'Hostel(id: $id, name: $name, description: $description, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceFromCampus: $distanceFromCampus, contactPhone: $contactPhone, contactEmail: $contactEmail, amenities: $amenities, rules: $rules, checkInTime: $checkInTime, checkOutTime: $checkOutTime, status: $status, isActive: $isActive, owner: $owner, rooms: $rooms, images: $images)';
}


}

/// @nodoc
abstract mixin class _$HostelCopyWith<$Res> implements $HostelCopyWith<$Res> {
  factory _$HostelCopyWith(_Hostel value, $Res Function(_Hostel) _then) = __$HostelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String address, String city, String state, String country, double? latitude, double? longitude, double? distanceFromCampus, String contactPhone, String? contactEmail, List<String> amenities, String? rules, String? checkInTime, String? checkOutTime, String status, bool isActive, Owner owner, List<Room> rooms, List<HostelImage> images
});


@override $OwnerCopyWith<$Res> get owner;

}
/// @nodoc
class __$HostelCopyWithImpl<$Res>
    implements _$HostelCopyWith<$Res> {
  __$HostelCopyWithImpl(this._self, this._then);

  final _Hostel _self;
  final $Res Function(_Hostel) _then;

/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? latitude = freezed,Object? longitude = freezed,Object? distanceFromCampus = freezed,Object? contactPhone = null,Object? contactEmail = freezed,Object? amenities = null,Object? rules = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? status = null,Object? isActive = null,Object? owner = null,Object? rooms = null,Object? images = null,}) {
  return _then(_Hostel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceFromCampus: freezed == distanceFromCampus ? _self.distanceFromCampus : distanceFromCampus // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,rules: freezed == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as Owner,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<HostelImage>,
  ));
}

/// Create a copy of Hostel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerCopyWith<$Res> get owner {
  
  return $OwnerCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on

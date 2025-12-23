// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Owner {

 String get id; String get firstName; String get lastName; String? get email; String? get phone;
/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerCopyWith<Owner> get copyWith => _$OwnerCopyWithImpl<Owner>(this as Owner, _$identity);

  /// Serializes this Owner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Owner&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone);

@override
String toString() {
  return 'Owner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $OwnerCopyWith<$Res>  {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) _then) = _$OwnerCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class _$OwnerCopyWithImpl<$Res>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._self, this._then);

  final Owner _self;
  final $Res Function(Owner) _then;

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Owner].
extension OwnerPatterns on Owner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Owner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Owner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Owner value)  $default,){
final _that = this;
switch (_that) {
case _Owner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Owner value)?  $default,){
final _that = this;
switch (_that) {
case _Owner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Owner() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _Owner():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _Owner() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Owner extends Owner {
  const _Owner({required this.id, required this.firstName, required this.lastName, this.email, this.phone}): super._();
  factory _Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? email;
@override final  String? phone;

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerCopyWith<_Owner> get copyWith => __$OwnerCopyWithImpl<_Owner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Owner&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,phone);

@override
String toString() {
  return 'Owner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$OwnerCopyWith(_Owner value, $Res Function(_Owner) _then) = __$OwnerCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class __$OwnerCopyWithImpl<$Res>
    implements _$OwnerCopyWith<$Res> {
  __$OwnerCopyWithImpl(this._self, this._then);

  final _Owner _self;
  final $Res Function(_Owner) _then;

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_Owner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roblox_versions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformVersion {

 String get platform; String get version; String get date;
/// Create a copy of PlatformVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformVersionCopyWith<PlatformVersion> get copyWith => _$PlatformVersionCopyWithImpl<PlatformVersion>(this as PlatformVersion, _$identity);

  /// Serializes this PlatformVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformVersion&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.version, version) || other.version == version)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,version,date);

@override
String toString() {
  return 'PlatformVersion(platform: $platform, version: $version, date: $date)';
}


}

/// @nodoc
abstract mixin class $PlatformVersionCopyWith<$Res>  {
  factory $PlatformVersionCopyWith(PlatformVersion value, $Res Function(PlatformVersion) _then) = _$PlatformVersionCopyWithImpl;
@useResult
$Res call({
 String platform, String version, String date
});




}
/// @nodoc
class _$PlatformVersionCopyWithImpl<$Res>
    implements $PlatformVersionCopyWith<$Res> {
  _$PlatformVersionCopyWithImpl(this._self, this._then);

  final PlatformVersion _self;
  final $Res Function(PlatformVersion) _then;

/// Create a copy of PlatformVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? version = null,Object? date = null,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlatformVersion].
extension PlatformVersionPatterns on PlatformVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformVersion value)  $default,){
final _that = this;
switch (_that) {
case _PlatformVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformVersion value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  String version,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformVersion() when $default != null:
return $default(_that.platform,_that.version,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  String version,  String date)  $default,) {final _that = this;
switch (_that) {
case _PlatformVersion():
return $default(_that.platform,_that.version,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  String version,  String date)?  $default,) {final _that = this;
switch (_that) {
case _PlatformVersion() when $default != null:
return $default(_that.platform,_that.version,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformVersion extends PlatformVersion {
  const _PlatformVersion({required this.platform, required this.version, required this.date}): super._();
  factory _PlatformVersion.fromJson(Map<String, dynamic> json) => _$PlatformVersionFromJson(json);

@override final  String platform;
@override final  String version;
@override final  String date;

/// Create a copy of PlatformVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformVersionCopyWith<_PlatformVersion> get copyWith => __$PlatformVersionCopyWithImpl<_PlatformVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformVersion&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.version, version) || other.version == version)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,version,date);

@override
String toString() {
  return 'PlatformVersion(platform: $platform, version: $version, date: $date)';
}


}

/// @nodoc
abstract mixin class _$PlatformVersionCopyWith<$Res> implements $PlatformVersionCopyWith<$Res> {
  factory _$PlatformVersionCopyWith(_PlatformVersion value, $Res Function(_PlatformVersion) _then) = __$PlatformVersionCopyWithImpl;
@override @useResult
$Res call({
 String platform, String version, String date
});




}
/// @nodoc
class __$PlatformVersionCopyWithImpl<$Res>
    implements _$PlatformVersionCopyWith<$Res> {
  __$PlatformVersionCopyWithImpl(this._self, this._then);

  final _PlatformVersion _self;
  final $Res Function(_PlatformVersion) _then;

/// Create a copy of PlatformVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? version = null,Object? date = null,}) {
  return _then(_PlatformVersion(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RobloxVersions {

 List<PlatformVersion> get platforms;
/// Create a copy of RobloxVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RobloxVersionsCopyWith<RobloxVersions> get copyWith => _$RobloxVersionsCopyWithImpl<RobloxVersions>(this as RobloxVersions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RobloxVersions&&const DeepCollectionEquality().equals(other.platforms, platforms));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(platforms));

@override
String toString() {
  return 'RobloxVersions(platforms: $platforms)';
}


}

/// @nodoc
abstract mixin class $RobloxVersionsCopyWith<$Res>  {
  factory $RobloxVersionsCopyWith(RobloxVersions value, $Res Function(RobloxVersions) _then) = _$RobloxVersionsCopyWithImpl;
@useResult
$Res call({
 List<PlatformVersion> platforms
});




}
/// @nodoc
class _$RobloxVersionsCopyWithImpl<$Res>
    implements $RobloxVersionsCopyWith<$Res> {
  _$RobloxVersionsCopyWithImpl(this._self, this._then);

  final RobloxVersions _self;
  final $Res Function(RobloxVersions) _then;

/// Create a copy of RobloxVersions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platforms = null,}) {
  return _then(_self.copyWith(
platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformVersion>,
  ));
}

}


/// Adds pattern-matching-related methods to [RobloxVersions].
extension RobloxVersionsPatterns on RobloxVersions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RobloxVersions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RobloxVersions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RobloxVersions value)  $default,){
final _that = this;
switch (_that) {
case _RobloxVersions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RobloxVersions value)?  $default,){
final _that = this;
switch (_that) {
case _RobloxVersions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlatformVersion> platforms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RobloxVersions() when $default != null:
return $default(_that.platforms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlatformVersion> platforms)  $default,) {final _that = this;
switch (_that) {
case _RobloxVersions():
return $default(_that.platforms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlatformVersion> platforms)?  $default,) {final _that = this;
switch (_that) {
case _RobloxVersions() when $default != null:
return $default(_that.platforms);case _:
  return null;

}
}

}

/// @nodoc


class _RobloxVersions extends RobloxVersions {
  const _RobloxVersions({required final  List<PlatformVersion> platforms}): _platforms = platforms,super._();
  

 final  List<PlatformVersion> _platforms;
@override List<PlatformVersion> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}


/// Create a copy of RobloxVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RobloxVersionsCopyWith<_RobloxVersions> get copyWith => __$RobloxVersionsCopyWithImpl<_RobloxVersions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RobloxVersions&&const DeepCollectionEquality().equals(other._platforms, _platforms));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_platforms));

@override
String toString() {
  return 'RobloxVersions(platforms: $platforms)';
}


}

/// @nodoc
abstract mixin class _$RobloxVersionsCopyWith<$Res> implements $RobloxVersionsCopyWith<$Res> {
  factory _$RobloxVersionsCopyWith(_RobloxVersions value, $Res Function(_RobloxVersions) _then) = __$RobloxVersionsCopyWithImpl;
@override @useResult
$Res call({
 List<PlatformVersion> platforms
});




}
/// @nodoc
class __$RobloxVersionsCopyWithImpl<$Res>
    implements _$RobloxVersionsCopyWith<$Res> {
  __$RobloxVersionsCopyWithImpl(this._self, this._then);

  final _RobloxVersions _self;
  final $Res Function(_RobloxVersions) _then;

/// Create a copy of RobloxVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platforms = null,}) {
  return _then(_RobloxVersions(
platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformVersion>,
  ));
}


}

// dart format on

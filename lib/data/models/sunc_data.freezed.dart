// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sunc_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuncTest {

 String get name; String get description; String get library; String get status; String? get reason;
/// Create a copy of SuncTest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuncTestCopyWith<SuncTest> get copyWith => _$SuncTestCopyWithImpl<SuncTest>(this as SuncTest, _$identity);

  /// Serializes this SuncTest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuncTest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.library, library) || other.library == library)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,library,status,reason);

@override
String toString() {
  return 'SuncTest(name: $name, description: $description, library: $library, status: $status, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SuncTestCopyWith<$Res>  {
  factory $SuncTestCopyWith(SuncTest value, $Res Function(SuncTest) _then) = _$SuncTestCopyWithImpl;
@useResult
$Res call({
 String name, String description, String library, String status, String? reason
});




}
/// @nodoc
class _$SuncTestCopyWithImpl<$Res>
    implements $SuncTestCopyWith<$Res> {
  _$SuncTestCopyWithImpl(this._self, this._then);

  final SuncTest _self;
  final $Res Function(SuncTest) _then;

/// Create a copy of SuncTest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? library = null,Object? status = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SuncTest].
extension SuncTestPatterns on SuncTest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuncTest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuncTest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuncTest value)  $default,){
final _that = this;
switch (_that) {
case _SuncTest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuncTest value)?  $default,){
final _that = this;
switch (_that) {
case _SuncTest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String library,  String status,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuncTest() when $default != null:
return $default(_that.name,_that.description,_that.library,_that.status,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String library,  String status,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _SuncTest():
return $default(_that.name,_that.description,_that.library,_that.status,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String library,  String status,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _SuncTest() when $default != null:
return $default(_that.name,_that.description,_that.library,_that.status,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuncTest extends SuncTest {
  const _SuncTest({this.name = '', this.description = '', this.library = 'Other', this.status = 'unknown', this.reason}): super._();
  factory _SuncTest.fromJson(Map<String, dynamic> json) => _$SuncTestFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String library;
@override@JsonKey() final  String status;
@override final  String? reason;

/// Create a copy of SuncTest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuncTestCopyWith<_SuncTest> get copyWith => __$SuncTestCopyWithImpl<_SuncTest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuncTestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuncTest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.library, library) || other.library == library)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,library,status,reason);

@override
String toString() {
  return 'SuncTest(name: $name, description: $description, library: $library, status: $status, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SuncTestCopyWith<$Res> implements $SuncTestCopyWith<$Res> {
  factory _$SuncTestCopyWith(_SuncTest value, $Res Function(_SuncTest) _then) = __$SuncTestCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String library, String status, String? reason
});




}
/// @nodoc
class __$SuncTestCopyWithImpl<$Res>
    implements _$SuncTestCopyWith<$Res> {
  __$SuncTestCopyWithImpl(this._self, this._then);

  final _SuncTest _self;
  final $Res Function(_SuncTest) _then;

/// Create a copy of SuncTest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? library = null,Object? status = null,Object? reason = freezed,}) {
  return _then(_SuncTest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SuncData {

@JsonKey(fromJson: SuncData._parseDouble) double get timestamp; String get version;@JsonKey(fromJson: SuncData._parseDouble) double get timeTaken; String get executor; bool get outdated; bool get bibip;@JsonKey(readValue: SuncData._readPassedTests) List<SuncTest> get passed;@JsonKey(readValue: SuncData._readFailedTests) List<SuncTest> get failed;
/// Create a copy of SuncData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuncDataCopyWith<SuncData> get copyWith => _$SuncDataCopyWithImpl<SuncData>(this as SuncData, _$identity);

  /// Serializes this SuncData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuncData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.version, version) || other.version == version)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.executor, executor) || other.executor == executor)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.bibip, bibip) || other.bibip == bibip)&&const DeepCollectionEquality().equals(other.passed, passed)&&const DeepCollectionEquality().equals(other.failed, failed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,version,timeTaken,executor,outdated,bibip,const DeepCollectionEquality().hash(passed),const DeepCollectionEquality().hash(failed));

@override
String toString() {
  return 'SuncData(timestamp: $timestamp, version: $version, timeTaken: $timeTaken, executor: $executor, outdated: $outdated, bibip: $bibip, passed: $passed, failed: $failed)';
}


}

/// @nodoc
abstract mixin class $SuncDataCopyWith<$Res>  {
  factory $SuncDataCopyWith(SuncData value, $Res Function(SuncData) _then) = _$SuncDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: SuncData._parseDouble) double timestamp, String version,@JsonKey(fromJson: SuncData._parseDouble) double timeTaken, String executor, bool outdated, bool bibip,@JsonKey(readValue: SuncData._readPassedTests) List<SuncTest> passed,@JsonKey(readValue: SuncData._readFailedTests) List<SuncTest> failed
});




}
/// @nodoc
class _$SuncDataCopyWithImpl<$Res>
    implements $SuncDataCopyWith<$Res> {
  _$SuncDataCopyWithImpl(this._self, this._then);

  final SuncData _self;
  final $Res Function(SuncData) _then;

/// Create a copy of SuncData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? version = null,Object? timeTaken = null,Object? executor = null,Object? outdated = null,Object? bibip = null,Object? passed = null,Object? failed = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as double,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as double,executor: null == executor ? _self.executor : executor // ignore: cast_nullable_to_non_nullable
as String,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,bibip: null == bibip ? _self.bibip : bibip // ignore: cast_nullable_to_non_nullable
as bool,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as List<SuncTest>,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as List<SuncTest>,
  ));
}

}


/// Adds pattern-matching-related methods to [SuncData].
extension SuncDataPatterns on SuncData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuncData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuncData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuncData value)  $default,){
final _that = this;
switch (_that) {
case _SuncData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuncData value)?  $default,){
final _that = this;
switch (_that) {
case _SuncData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: SuncData._parseDouble)  double timestamp,  String version, @JsonKey(fromJson: SuncData._parseDouble)  double timeTaken,  String executor,  bool outdated,  bool bibip, @JsonKey(readValue: SuncData._readPassedTests)  List<SuncTest> passed, @JsonKey(readValue: SuncData._readFailedTests)  List<SuncTest> failed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuncData() when $default != null:
return $default(_that.timestamp,_that.version,_that.timeTaken,_that.executor,_that.outdated,_that.bibip,_that.passed,_that.failed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: SuncData._parseDouble)  double timestamp,  String version, @JsonKey(fromJson: SuncData._parseDouble)  double timeTaken,  String executor,  bool outdated,  bool bibip, @JsonKey(readValue: SuncData._readPassedTests)  List<SuncTest> passed, @JsonKey(readValue: SuncData._readFailedTests)  List<SuncTest> failed)  $default,) {final _that = this;
switch (_that) {
case _SuncData():
return $default(_that.timestamp,_that.version,_that.timeTaken,_that.executor,_that.outdated,_that.bibip,_that.passed,_that.failed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: SuncData._parseDouble)  double timestamp,  String version, @JsonKey(fromJson: SuncData._parseDouble)  double timeTaken,  String executor,  bool outdated,  bool bibip, @JsonKey(readValue: SuncData._readPassedTests)  List<SuncTest> passed, @JsonKey(readValue: SuncData._readFailedTests)  List<SuncTest> failed)?  $default,) {final _that = this;
switch (_that) {
case _SuncData() when $default != null:
return $default(_that.timestamp,_that.version,_that.timeTaken,_that.executor,_that.outdated,_that.bibip,_that.passed,_that.failed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuncData extends SuncData {
  const _SuncData({@JsonKey(fromJson: SuncData._parseDouble) this.timestamp = 0.0, this.version = '—', @JsonKey(fromJson: SuncData._parseDouble) this.timeTaken = 0.0, this.executor = '—', this.outdated = false, this.bibip = false, @JsonKey(readValue: SuncData._readPassedTests) final  List<SuncTest> passed = const [], @JsonKey(readValue: SuncData._readFailedTests) final  List<SuncTest> failed = const []}): _passed = passed,_failed = failed,super._();
  factory _SuncData.fromJson(Map<String, dynamic> json) => _$SuncDataFromJson(json);

@override@JsonKey(fromJson: SuncData._parseDouble) final  double timestamp;
@override@JsonKey() final  String version;
@override@JsonKey(fromJson: SuncData._parseDouble) final  double timeTaken;
@override@JsonKey() final  String executor;
@override@JsonKey() final  bool outdated;
@override@JsonKey() final  bool bibip;
 final  List<SuncTest> _passed;
@override@JsonKey(readValue: SuncData._readPassedTests) List<SuncTest> get passed {
  if (_passed is EqualUnmodifiableListView) return _passed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_passed);
}

 final  List<SuncTest> _failed;
@override@JsonKey(readValue: SuncData._readFailedTests) List<SuncTest> get failed {
  if (_failed is EqualUnmodifiableListView) return _failed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failed);
}


/// Create a copy of SuncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuncDataCopyWith<_SuncData> get copyWith => __$SuncDataCopyWithImpl<_SuncData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuncDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuncData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.version, version) || other.version == version)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.executor, executor) || other.executor == executor)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.bibip, bibip) || other.bibip == bibip)&&const DeepCollectionEquality().equals(other._passed, _passed)&&const DeepCollectionEquality().equals(other._failed, _failed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,version,timeTaken,executor,outdated,bibip,const DeepCollectionEquality().hash(_passed),const DeepCollectionEquality().hash(_failed));

@override
String toString() {
  return 'SuncData(timestamp: $timestamp, version: $version, timeTaken: $timeTaken, executor: $executor, outdated: $outdated, bibip: $bibip, passed: $passed, failed: $failed)';
}


}

/// @nodoc
abstract mixin class _$SuncDataCopyWith<$Res> implements $SuncDataCopyWith<$Res> {
  factory _$SuncDataCopyWith(_SuncData value, $Res Function(_SuncData) _then) = __$SuncDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: SuncData._parseDouble) double timestamp, String version,@JsonKey(fromJson: SuncData._parseDouble) double timeTaken, String executor, bool outdated, bool bibip,@JsonKey(readValue: SuncData._readPassedTests) List<SuncTest> passed,@JsonKey(readValue: SuncData._readFailedTests) List<SuncTest> failed
});




}
/// @nodoc
class __$SuncDataCopyWithImpl<$Res>
    implements _$SuncDataCopyWith<$Res> {
  __$SuncDataCopyWithImpl(this._self, this._then);

  final _SuncData _self;
  final $Res Function(_SuncData) _then;

/// Create a copy of SuncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? version = null,Object? timeTaken = null,Object? executor = null,Object? outdated = null,Object? bibip = null,Object? passed = null,Object? failed = null,}) {
  return _then(_SuncData(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as double,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as double,executor: null == executor ? _self.executor : executor // ignore: cast_nullable_to_non_nullable
as String,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,bibip: null == bibip ? _self.bibip : bibip // ignore: cast_nullable_to_non_nullable
as bool,passed: null == passed ? _self._passed : passed // ignore: cast_nullable_to_non_nullable
as List<SuncTest>,failed: null == failed ? _self._failed : failed // ignore: cast_nullable_to_non_nullable
as List<SuncTest>,
  ));
}


}

/// @nodoc
mixin _$SuncRequest {

 String get scrap; String get key;
/// Create a copy of SuncRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuncRequestCopyWith<SuncRequest> get copyWith => _$SuncRequestCopyWithImpl<SuncRequest>(this as SuncRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuncRequest&&(identical(other.scrap, scrap) || other.scrap == scrap)&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,scrap,key);

@override
String toString() {
  return 'SuncRequest(scrap: $scrap, key: $key)';
}


}

/// @nodoc
abstract mixin class $SuncRequestCopyWith<$Res>  {
  factory $SuncRequestCopyWith(SuncRequest value, $Res Function(SuncRequest) _then) = _$SuncRequestCopyWithImpl;
@useResult
$Res call({
 String scrap, String key
});




}
/// @nodoc
class _$SuncRequestCopyWithImpl<$Res>
    implements $SuncRequestCopyWith<$Res> {
  _$SuncRequestCopyWithImpl(this._self, this._then);

  final SuncRequest _self;
  final $Res Function(SuncRequest) _then;

/// Create a copy of SuncRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scrap = null,Object? key = null,}) {
  return _then(_self.copyWith(
scrap: null == scrap ? _self.scrap : scrap // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuncRequest].
extension SuncRequestPatterns on SuncRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuncRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuncRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuncRequest value)  $default,){
final _that = this;
switch (_that) {
case _SuncRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuncRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SuncRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String scrap,  String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuncRequest() when $default != null:
return $default(_that.scrap,_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String scrap,  String key)  $default,) {final _that = this;
switch (_that) {
case _SuncRequest():
return $default(_that.scrap,_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String scrap,  String key)?  $default,) {final _that = this;
switch (_that) {
case _SuncRequest() when $default != null:
return $default(_that.scrap,_that.key);case _:
  return null;

}
}

}

/// @nodoc


class _SuncRequest extends SuncRequest {
  const _SuncRequest({required this.scrap, required this.key}): super._();
  

@override final  String scrap;
@override final  String key;

/// Create a copy of SuncRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuncRequestCopyWith<_SuncRequest> get copyWith => __$SuncRequestCopyWithImpl<_SuncRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuncRequest&&(identical(other.scrap, scrap) || other.scrap == scrap)&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,scrap,key);

@override
String toString() {
  return 'SuncRequest(scrap: $scrap, key: $key)';
}


}

/// @nodoc
abstract mixin class _$SuncRequestCopyWith<$Res> implements $SuncRequestCopyWith<$Res> {
  factory _$SuncRequestCopyWith(_SuncRequest value, $Res Function(_SuncRequest) _then) = __$SuncRequestCopyWithImpl;
@override @useResult
$Res call({
 String scrap, String key
});




}
/// @nodoc
class __$SuncRequestCopyWithImpl<$Res>
    implements _$SuncRequestCopyWith<$Res> {
  __$SuncRequestCopyWithImpl(this._self, this._then);

  final _SuncRequest _self;
  final $Res Function(_SuncRequest) _then;

/// Create a copy of SuncRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scrap = null,Object? key = null,}) {
  return _then(_SuncRequest(
scrap: null == scrap ? _self.scrap : scrap // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

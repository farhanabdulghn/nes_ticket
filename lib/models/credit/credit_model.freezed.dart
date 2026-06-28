// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditModel {

 List<MemberModel>? get cast; List<MemberModel>? get crew;
/// Create a copy of CreditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditModelCopyWith<CreditModel> get copyWith => _$CreditModelCopyWithImpl<CreditModel>(this as CreditModel, _$identity);

  /// Serializes this CreditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditModel&&const DeepCollectionEquality().equals(other.cast, cast)&&const DeepCollectionEquality().equals(other.crew, crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cast),const DeepCollectionEquality().hash(crew));

@override
String toString() {
  return 'CreditModel(cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class $CreditModelCopyWith<$Res>  {
  factory $CreditModelCopyWith(CreditModel value, $Res Function(CreditModel) _then) = _$CreditModelCopyWithImpl;
@useResult
$Res call({
 List<MemberModel>? cast, List<MemberModel>? crew
});




}
/// @nodoc
class _$CreditModelCopyWithImpl<$Res>
    implements $CreditModelCopyWith<$Res> {
  _$CreditModelCopyWithImpl(this._self, this._then);

  final CreditModel _self;
  final $Res Function(CreditModel) _then;

/// Create a copy of CreditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cast = freezed,Object? crew = freezed,}) {
  return _then(_self.copyWith(
cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<MemberModel>?,crew: freezed == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<MemberModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditModel].
extension CreditModelPatterns on CreditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MemberModel>? cast,  List<MemberModel>? crew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditModel() when $default != null:
return $default(_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MemberModel>? cast,  List<MemberModel>? crew)  $default,) {final _that = this;
switch (_that) {
case _CreditModel():
return $default(_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MemberModel>? cast,  List<MemberModel>? crew)?  $default,) {final _that = this;
switch (_that) {
case _CreditModel() when $default != null:
return $default(_that.cast,_that.crew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditModel implements CreditModel {
  const _CreditModel({final  List<MemberModel>? cast, final  List<MemberModel>? crew}): _cast = cast,_crew = crew;
  factory _CreditModel.fromJson(Map<String, dynamic> json) => _$CreditModelFromJson(json);

 final  List<MemberModel>? _cast;
@override List<MemberModel>? get cast {
  final value = _cast;
  if (value == null) return null;
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MemberModel>? _crew;
@override List<MemberModel>? get crew {
  final value = _crew;
  if (value == null) return null;
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditModelCopyWith<_CreditModel> get copyWith => __$CreditModelCopyWithImpl<_CreditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditModel&&const DeepCollectionEquality().equals(other._cast, _cast)&&const DeepCollectionEquality().equals(other._crew, _crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cast),const DeepCollectionEquality().hash(_crew));

@override
String toString() {
  return 'CreditModel(cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class _$CreditModelCopyWith<$Res> implements $CreditModelCopyWith<$Res> {
  factory _$CreditModelCopyWith(_CreditModel value, $Res Function(_CreditModel) _then) = __$CreditModelCopyWithImpl;
@override @useResult
$Res call({
 List<MemberModel>? cast, List<MemberModel>? crew
});




}
/// @nodoc
class __$CreditModelCopyWithImpl<$Res>
    implements _$CreditModelCopyWith<$Res> {
  __$CreditModelCopyWithImpl(this._self, this._then);

  final _CreditModel _self;
  final $Res Function(_CreditModel) _then;

/// Create a copy of CreditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cast = freezed,Object? crew = freezed,}) {
  return _then(_CreditModel(
cast: freezed == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<MemberModel>?,crew: freezed == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<MemberModel>?,
  ));
}


}

// dart format on

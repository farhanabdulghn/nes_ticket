// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedModel<T> {

 int get page; int get totalPages; int get totalResults; List<T> get results;
/// Create a copy of PaginatedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedModelCopyWith<T, PaginatedModel<T>> get copyWith => _$PaginatedModelCopyWithImpl<T, PaginatedModel<T>>(this as PaginatedModel<T>, _$identity);

  /// Serializes this PaginatedModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedModel<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedModel<$T>(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedModelCopyWith<T,$Res>  {
  factory $PaginatedModelCopyWith(PaginatedModel<T> value, $Res Function(PaginatedModel<T>) _then) = _$PaginatedModelCopyWithImpl;
@useResult
$Res call({
 int page, int totalPages, int totalResults, List<T> results
});




}
/// @nodoc
class _$PaginatedModelCopyWithImpl<T,$Res>
    implements $PaginatedModelCopyWith<T, $Res> {
  _$PaginatedModelCopyWithImpl(this._self, this._then);

  final PaginatedModel<T> _self;
  final $Res Function(PaginatedModel<T>) _then;

/// Create a copy of PaginatedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedModel].
extension PaginatedModelPatterns<T> on PaginatedModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int totalPages,  int totalResults,  List<T> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedModel() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int totalPages,  int totalResults,  List<T> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedModel():
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int totalPages,  int totalResults,  List<T> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedModel() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedModel<T> implements PaginatedModel<T> {
  const _PaginatedModel({required this.page, required this.totalPages, required this.totalResults, required final  List<T> results}): _results = results;
  factory _PaginatedModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedModelFromJson(json,fromJsonT);

@override final  int page;
@override final  int totalPages;
@override final  int totalResults;
 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedModelCopyWith<T, _PaginatedModel<T>> get copyWith => __$PaginatedModelCopyWithImpl<T, _PaginatedModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedModel<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedModel<$T>(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedModelCopyWith<T,$Res> implements $PaginatedModelCopyWith<T, $Res> {
  factory _$PaginatedModelCopyWith(_PaginatedModel<T> value, $Res Function(_PaginatedModel<T>) _then) = __$PaginatedModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int totalPages, int totalResults, List<T> results
});




}
/// @nodoc
class __$PaginatedModelCopyWithImpl<T,$Res>
    implements _$PaginatedModelCopyWith<T, $Res> {
  __$PaginatedModelCopyWithImpl(this._self, this._then);

  final _PaginatedModel<T> _self;
  final $Res Function(_PaginatedModel<T>) _then;

/// Create a copy of PaginatedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_PaginatedModel<T>(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on

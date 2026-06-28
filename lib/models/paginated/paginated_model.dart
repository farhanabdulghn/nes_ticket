import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_model.freezed.dart';
part 'paginated_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedModel<T> with _$PaginatedModel<T> {
  const factory PaginatedModel({
    required int page,
    required int totalPages,
    required int totalResults,
    required List<T> results,
  }) = _PaginatedModel<T>;

  factory PaginatedModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedModelFromJson(json, fromJsonT);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
abstract class MediaModel with _$MediaModel {
  const MediaModel._();

  const factory MediaModel({
    bool? adult,
    String? backdropPath,
    int? id,
    String? title,
    String? name,
    String? originalLanguage,
    String? originalTitle,
    String? originalName,
    String? overview,
    String? posterPath,
    MediaType? mediaType,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
    DateTime? firstAirDate,
    List<String>? originCountry,
  }) = _MediaModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  String get displayTitle =>
      name ?? title ?? originalName ?? originalTitle ?? '-';
}

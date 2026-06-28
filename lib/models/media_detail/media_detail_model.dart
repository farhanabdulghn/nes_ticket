import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

part 'media_detail_model.freezed.dart';
part 'media_detail_model.g.dart';

@freezed
@HiveType(typeId: 1)
abstract class MediaDetailModel with _$MediaDetailModel {
  const MediaDetailModel._();

  const factory MediaDetailModel({
    @HiveField(0) bool? adult,
    @HiveField(1) String? backdropPath,
    @HiveField(2) BelongsToCollection? belongsToCollection,
    @HiveField(3) int? budget,
    @HiveField(4) List<Genre>? genres,
    @HiveField(5) String? homepage,
    @HiveField(6) int? id,
    @HiveField(7) String? imdbId,
    @HiveField(8) List<String>? originCountry,
    @HiveField(9) String? originalLanguage,
    @HiveField(10) String? originalTitle,
    @HiveField(11) String? originalName,
    @HiveField(12) String? overview,
    @HiveField(13) double? popularity,
    @HiveField(14) String? posterPath,
    @HiveField(15) List<ProductionCompany>? productionCompanies,
    @HiveField(16) List<ProductionCountry>? productionCountries,
    @HiveField(17) DateTime? releaseDate,
    @HiveField(18) int? revenue,
    @HiveField(19) int? runtime,
    @HiveField(20) List<SpokenLanguage>? spokenLanguages,
    @HiveField(21) String? status,
    @HiveField(22) String? tagline,
    @HiveField(23) String? title,
    @HiveField(24) String? name,
    @HiveField(25) bool? video,
    @HiveField(26) double? voteAverage,
    @HiveField(27) int? voteCount,
    @HiveField(28) MediaType? mediaType,
  }) = _MediaDetailModel;

  factory MediaDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MediaDetailModelFromJson(json);

  String get displayTitle =>
      name ?? title ?? originalName ?? originalTitle ?? '-';
}

@freezed
@HiveType(typeId: 2)
abstract class BelongsToCollection with _$BelongsToCollection {
  const factory BelongsToCollection({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? posterPath,
    @HiveField(3) String? backdropPath,
  }) = _BelongsToCollection;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@freezed
@HiveType(typeId: 3)
abstract class Genre with _$Genre {
  const factory Genre({@HiveField(0) int? id, @HiveField(1) String? name}) =
      _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
@HiveType(typeId: 4)
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @HiveField(0) int? id,
    @HiveField(1) String? logoPath,
    @HiveField(2) String? name,
    @HiveField(3) String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
@HiveType(typeId: 5)
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @HiveField(0) @JsonKey(name: 'iso_3166_1') String? iso31661,
    @HiveField(1) String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
@HiveType(typeId: 6)
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @HiveField(0) String? englishName,
    @HiveField(1) @JsonKey(name: 'iso_639_1') String? iso6391,
    @HiveField(2) String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

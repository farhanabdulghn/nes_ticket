import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    String? author,
    AuthorDetails? authorDetails,
    String? content,
    DateTime? createdAt,
    String? id,
    DateTime? updatedAt,
    String? url,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
abstract class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    String? name,
    String? username,
    String? avatarPath,
    double? rating,
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);
}

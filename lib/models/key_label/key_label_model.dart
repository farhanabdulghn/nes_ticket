import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_label_model.freezed.dart';
part 'key_label_model.g.dart';

@freezed
abstract class KeyLabelModel with _$KeyLabelModel {
  const factory KeyLabelModel({int? id, String? name}) = _KeyLabelModel;

  factory KeyLabelModel.fromJson(Map<String, dynamic> json) =>
      _$KeyLabelModelFromJson(json);
}

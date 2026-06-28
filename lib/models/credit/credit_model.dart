import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_ticket/models/member/member_model.dart';

part 'credit_model.freezed.dart';
part 'credit_model.g.dart';

@freezed
abstract class CreditModel with _$CreditModel {
  const factory CreditModel({
    List<MemberModel>? cast,
    List<MemberModel>? crew,
  }) = _CreditModel;

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);
}

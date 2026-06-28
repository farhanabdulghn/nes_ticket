// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditModel _$CreditModelFromJson(Map<String, dynamic> json) => _CreditModel(
  cast: (json['cast'] as List<dynamic>?)
      ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreditModelToJson(_CreditModel instance) =>
    <String, dynamic>{
      'cast': instance.cast?.map((e) => e.toJson()).toList(),
      'crew': instance.crew?.map((e) => e.toJson()).toList(),
    };

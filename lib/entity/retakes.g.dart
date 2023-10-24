// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retakes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetakesEntity _$RetakesEntityFromJson(Map<String, dynamic> json) =>
    RetakesEntity(
      retakes: (json['retakes'] as List<dynamic>)
          .map((e) => RetakeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RetakesEntityToJson(RetakesEntity instance) =>
    <String, dynamic>{
      'retakes': instance.retakes,
    };

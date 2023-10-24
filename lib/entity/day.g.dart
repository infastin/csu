// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayEntity _$DayEntityFromJson(Map<String, dynamic> json) => DayEntity(
      weekday: json['weekday'] as int,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayEntityToJson(DayEntity instance) => <String, dynamic>{
      'weekday': instance.weekday,
      'subjects': instance.subjects,
    };

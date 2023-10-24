// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleEntity _$ScheduleEntityFromJson(Map<String, dynamic> json) =>
    ScheduleEntity(
      oddWeek: (json['oddWeek'] as List<dynamic>)
          .map((e) => DayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      evenWeek: (json['evenWeek'] as List<dynamic>)
          .map((e) => DayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleEntityToJson(ScheduleEntity instance) =>
    <String, dynamic>{
      'oddWeek': instance.oddWeek,
      'evenWeek': instance.evenWeek,
    };

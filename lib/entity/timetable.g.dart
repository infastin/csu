// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeTableEntity _$TimeTableEntityFromJson(Map<String, dynamic> json) =>
    TimeTableEntity(
      timetable: (json['timetable'] as List<dynamic>)
          .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeTableEntityToJson(TimeTableEntity instance) =>
    <String, dynamic>{
      'timetable': instance.timetable,
    };

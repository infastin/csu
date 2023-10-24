// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetakeEntity _$RetakeEntityFromJson(Map<String, dynamic> json) => RetakeEntity(
      name: json['name'] as String,
      room: json['room'] as String,
      lecturer:
          LecturerEntity.fromJson(json['lecturer'] as Map<String, dynamic>),
      number: json['number'] as int,
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$RetakeEntityToJson(RetakeEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'room': instance.room,
      'lecturer': instance.lecturer,
      'number': instance.number,
      'timeRange': instance.timeRange,
      'date': instance.date.toIso8601String(),
    };

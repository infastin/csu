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
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$RetakeEntityToJson(RetakeEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'room': instance.room,
      'lecturer': instance.lecturer,
      'dateTime': instance.dateTime.toIso8601String(),
    };

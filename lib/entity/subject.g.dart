// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectEntity _$SubjectEntityFromJson(Map<String, dynamic> json) =>
    SubjectEntity(
      name: json['name'] as String,
      room: json['room'] as String,
      type: $enumDecode(_$SubjectTypeEnumMap, json['type']),
      lecturer:
          LecturerEntity.fromJson(json['lecturer'] as Map<String, dynamic>),
      number: json['number'] as int,
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectEntityToJson(SubjectEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'room': instance.room,
      'type': _$SubjectTypeEnumMap[instance.type]!,
      'lecturer': instance.lecturer,
      'number': instance.number,
      'timeRange': instance.timeRange,
    };

const _$SubjectTypeEnumMap = {
  SubjectType.unknown: 'UNKNOWN',
  SubjectType.lecture: 'LECTURE',
  SubjectType.practice: 'PRACTICE',
  SubjectType.lab: 'LAB',
};

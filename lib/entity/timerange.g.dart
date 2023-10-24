// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timerange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) => TimeRange(
      start: const TimeOfDayJsonConverter().fromJson(json['start'] as String),
      end: const TimeOfDayJsonConverter().fromJson(json['end'] as String),
    );

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) => <String, dynamic>{
      'start': const TimeOfDayJsonConverter().toJson(instance.start),
      'end': const TimeOfDayJsonConverter().toJson(instance.end),
    };

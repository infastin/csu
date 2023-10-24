// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LecturerEntity _$LecturerEntityFromJson(Map<String, dynamic> json) =>
    LecturerEntity(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
    );

Map<String, dynamic> _$LecturerEntityToJson(LecturerEntity instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
    };

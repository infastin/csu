// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsEntity _$GroupsEntityFromJson(Map<String, dynamic> json) => GroupsEntity(
      groups:
          (json['groups'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GroupsEntityToJson(GroupsEntity instance) =>
    <String, dynamic>{
      'groups': instance.groups,
    };

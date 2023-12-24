//
//  Generated code. Do not modify.
//  source: csu.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use timeTableResponseDescriptor instead')
const TimeTableResponse$json = {
  '1': 'TimeTableResponse',
  '2': [
    {'1': 'timetable', '3': 1, '4': 3, '5': 11, '6': '.schedule.TimeRange', '10': 'timetable'},
  ],
};

/// Descriptor for `TimeTableResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeTableResponseDescriptor = $convert.base64Decode(
    'ChFUaW1lVGFibGVSZXNwb25zZRIxCgl0aW1ldGFibGUYASADKAsyEy5zY2hlZHVsZS5UaW1lUm'
    'FuZ2VSCXRpbWV0YWJsZQ==');

@$core.Deprecated('Use groupsResponseDescriptor instead')
const GroupsResponse$json = {
  '1': 'GroupsResponse',
  '2': [
    {'1': 'groups', '3': 1, '4': 3, '5': 9, '10': 'groups'},
  ],
};

/// Descriptor for `GroupsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupsResponseDescriptor = $convert.base64Decode(
    'Cg5Hcm91cHNSZXNwb25zZRIWCgZncm91cHMYASADKAlSBmdyb3Vwcw==');

@$core.Deprecated('Use lecturerDescriptor instead')
const Lecturer$json = {
  '1': 'Lecturer',
  '2': [
    {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'middleName', '3': 3, '4': 1, '5': 9, '10': 'middleName'},
  ],
};

/// Descriptor for `Lecturer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lecturerDescriptor = $convert.base64Decode(
    'CghMZWN0dXJlchIcCglmaXJzdE5hbWUYASABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgCIA'
    'EoCVIIbGFzdE5hbWUSHgoKbWlkZGxlTmFtZRgDIAEoCVIKbWlkZGxlTmFtZQ==');

@$core.Deprecated('Use timeOfDayDescriptor instead')
const TimeOfDay$json = {
  '1': 'TimeOfDay',
  '2': [
    {'1': 'hour', '3': 1, '4': 1, '5': 5, '10': 'hour'},
    {'1': 'minute', '3': 2, '4': 1, '5': 5, '10': 'minute'},
  ],
};

/// Descriptor for `TimeOfDay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeOfDayDescriptor = $convert.base64Decode(
    'CglUaW1lT2ZEYXkSEgoEaG91chgBIAEoBVIEaG91chIWCgZtaW51dGUYAiABKAVSBm1pbnV0ZQ'
    '==');

@$core.Deprecated('Use timeRangeDescriptor instead')
const TimeRange$json = {
  '1': 'TimeRange',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 11, '6': '.schedule.TimeOfDay', '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 11, '6': '.schedule.TimeOfDay', '10': 'end'},
  ],
};

/// Descriptor for `TimeRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeRangeDescriptor = $convert.base64Decode(
    'CglUaW1lUmFuZ2USKQoFc3RhcnQYASABKAsyEy5zY2hlZHVsZS5UaW1lT2ZEYXlSBXN0YXJ0Ei'
    'UKA2VuZBgCIAEoCzITLnNjaGVkdWxlLlRpbWVPZkRheVIDZW5k');

@$core.Deprecated('Use subjectDescriptor instead')
const Subject$json = {
  '1': 'Subject',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room', '3': 2, '4': 1, '5': 9, '10': 'room'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.schedule.Subject.SubjectType', '10': 'type'},
    {'1': 'lecturer', '3': 4, '4': 1, '5': 11, '6': '.schedule.Lecturer', '10': 'lecturer'},
    {'1': 'number', '3': 5, '4': 1, '5': 5, '10': 'number'},
    {'1': 'timeRange', '3': 6, '4': 1, '5': 11, '6': '.schedule.TimeRange', '10': 'timeRange'},
    {'1': 'subgroup', '3': 7, '4': 1, '5': 5, '10': 'subgroup'},
  ],
  '4': [Subject_SubjectType$json],
};

@$core.Deprecated('Use subjectDescriptor instead')
const Subject_SubjectType$json = {
  '1': 'SubjectType',
  '2': [
    {'1': 'LECTURE', '2': 0},
    {'1': 'PRACTICE', '2': 1},
    {'1': 'LAB', '2': 2},
  ],
};

/// Descriptor for `Subject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subjectDescriptor = $convert.base64Decode(
    'CgdTdWJqZWN0EhIKBG5hbWUYASABKAlSBG5hbWUSEgoEcm9vbRgCIAEoCVIEcm9vbRIxCgR0eX'
    'BlGAMgASgOMh0uc2NoZWR1bGUuU3ViamVjdC5TdWJqZWN0VHlwZVIEdHlwZRIuCghsZWN0dXJl'
    'chgEIAEoCzISLnNjaGVkdWxlLkxlY3R1cmVyUghsZWN0dXJlchIWCgZudW1iZXIYBSABKAVSBm'
    '51bWJlchIxCgl0aW1lUmFuZ2UYBiABKAsyEy5zY2hlZHVsZS5UaW1lUmFuZ2VSCXRpbWVSYW5n'
    'ZRIaCghzdWJncm91cBgHIAEoBVIIc3ViZ3JvdXAiMQoLU3ViamVjdFR5cGUSCwoHTEVDVFVSRR'
    'AAEgwKCFBSQUNUSUNFEAESBwoDTEFCEAI=');

@$core.Deprecated('Use dayDescriptor instead')
const Day$json = {
  '1': 'Day',
  '2': [
    {'1': 'weekday', '3': 1, '4': 1, '5': 5, '10': 'weekday'},
    {'1': 'subjects', '3': 2, '4': 3, '5': 11, '6': '.schedule.Subject', '10': 'subjects'},
  ],
};

/// Descriptor for `Day`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dayDescriptor = $convert.base64Decode(
    'CgNEYXkSGAoHd2Vla2RheRgBIAEoBVIHd2Vla2RheRItCghzdWJqZWN0cxgCIAMoCzIRLnNjaG'
    'VkdWxlLlN1YmplY3RSCHN1YmplY3Rz');

@$core.Deprecated('Use scheduleRequestDescriptor instead')
const ScheduleRequest$json = {
  '1': 'ScheduleRequest',
  '2': [
    {'1': 'group', '3': 1, '4': 1, '5': 9, '10': 'group'},
  ],
};

/// Descriptor for `ScheduleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRequestDescriptor = $convert.base64Decode(
    'Cg9TY2hlZHVsZVJlcXVlc3QSFAoFZ3JvdXAYASABKAlSBWdyb3Vw');

@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse$json = {
  '1': 'ScheduleResponse',
  '2': [
    {'1': 'oddWeek', '3': 1, '4': 3, '5': 11, '6': '.schedule.Day', '10': 'oddWeek'},
    {'1': 'evenWeek', '3': 2, '4': 3, '5': 11, '6': '.schedule.Day', '10': 'evenWeek'},
  ],
};

/// Descriptor for `ScheduleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleResponseDescriptor = $convert.base64Decode(
    'ChBTY2hlZHVsZVJlc3BvbnNlEicKB29kZFdlZWsYASADKAsyDS5zY2hlZHVsZS5EYXlSB29kZF'
    'dlZWsSKQoIZXZlbldlZWsYAiADKAsyDS5zY2hlZHVsZS5EYXlSCGV2ZW5XZWVr');

@$core.Deprecated('Use retakeDescriptor instead')
const Retake$json = {
  '1': 'Retake',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'room', '3': 2, '4': 1, '5': 9, '10': 'room'},
    {'1': 'lecturer', '3': 3, '4': 1, '5': 11, '6': '.schedule.Lecturer', '10': 'lecturer'},
    {'1': 'dateTime', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTime'},
  ],
};

/// Descriptor for `Retake`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retakeDescriptor = $convert.base64Decode(
    'CgZSZXRha2USEgoEbmFtZRgBIAEoCVIEbmFtZRISCgRyb29tGAIgASgJUgRyb29tEi4KCGxlY3'
    'R1cmVyGAMgASgLMhIuc2NoZWR1bGUuTGVjdHVyZXJSCGxlY3R1cmVyEjYKCGRhdGVUaW1lGAQg'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIZGF0ZVRpbWU=');

@$core.Deprecated('Use retakesRequestDescriptor instead')
const RetakesRequest$json = {
  '1': 'RetakesRequest',
  '2': [
    {'1': 'group', '3': 1, '4': 1, '5': 9, '10': 'group'},
  ],
};

/// Descriptor for `RetakesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retakesRequestDescriptor = $convert.base64Decode(
    'Cg5SZXRha2VzUmVxdWVzdBIUCgVncm91cBgBIAEoCVIFZ3JvdXA=');

@$core.Deprecated('Use retakesResponseDescriptor instead')
const RetakesResponse$json = {
  '1': 'RetakesResponse',
  '2': [
    {'1': 'retakes', '3': 1, '4': 3, '5': 11, '6': '.schedule.Retake', '10': 'retakes'},
  ],
};

/// Descriptor for `RetakesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retakesResponseDescriptor = $convert.base64Decode(
    'Cg9SZXRha2VzUmVzcG9uc2USKgoHcmV0YWtlcxgBIAMoCzIQLnNjaGVkdWxlLlJldGFrZVIHcm'
    'V0YWtlcw==');


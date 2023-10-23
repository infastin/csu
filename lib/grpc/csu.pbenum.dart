//
//  Generated code. Do not modify.
//  source: csu.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Subject_SubjectType extends $pb.ProtobufEnum {
  static const Subject_SubjectType LECTURE = Subject_SubjectType._(0, _omitEnumNames ? '' : 'LECTURE');
  static const Subject_SubjectType PRACTICE = Subject_SubjectType._(1, _omitEnumNames ? '' : 'PRACTICE');
  static const Subject_SubjectType LAB = Subject_SubjectType._(2, _omitEnumNames ? '' : 'LAB');

  static const $core.List<Subject_SubjectType> values = <Subject_SubjectType> [
    LECTURE,
    PRACTICE,
    LAB,
  ];

  static final $core.Map<$core.int, Subject_SubjectType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Subject_SubjectType? valueOf($core.int value) => _byValue[value];

  const Subject_SubjectType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

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

import 'csu.pbenum.dart';
import 'google/protobuf/timestamp.pb.dart' as $1;

export 'csu.pbenum.dart';

class Lecturer extends $pb.GeneratedMessage {
  factory Lecturer({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? middleName,
  }) {
    final $result = create();
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (middleName != null) {
      $result.middleName = middleName;
    }
    return $result;
  }
  Lecturer._() : super();
  factory Lecturer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lecturer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lecturer', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName', protoName: 'lastName')
    ..aOS(3, _omitFieldNames ? '' : 'middleName', protoName: 'middleName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lecturer clone() => Lecturer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lecturer copyWith(void Function(Lecturer) updates) => super.copyWith((message) => updates(message as Lecturer)) as Lecturer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lecturer create() => Lecturer._();
  Lecturer createEmptyInstance() => create();
  static $pb.PbList<Lecturer> createRepeated() => $pb.PbList<Lecturer>();
  @$core.pragma('dart2js:noInline')
  static Lecturer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lecturer>(create);
  static Lecturer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get middleName => $_getSZ(2);
  @$pb.TagNumber(3)
  set middleName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMiddleName() => $_has(2);
  @$pb.TagNumber(3)
  void clearMiddleName() => clearField(3);
}

class TimeOfDay extends $pb.GeneratedMessage {
  factory TimeOfDay({
    $core.int? hour,
    $core.int? minute,
  }) {
    final $result = create();
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    return $result;
  }
  TimeOfDay._() : super();
  factory TimeOfDay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeOfDay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeOfDay', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeOfDay clone() => TimeOfDay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeOfDay copyWith(void Function(TimeOfDay) updates) => super.copyWith((message) => updates(message as TimeOfDay)) as TimeOfDay;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeOfDay create() => TimeOfDay._();
  TimeOfDay createEmptyInstance() => create();
  static $pb.PbList<TimeOfDay> createRepeated() => $pb.PbList<TimeOfDay>();
  @$core.pragma('dart2js:noInline')
  static TimeOfDay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeOfDay>(create);
  static TimeOfDay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hour => $_getIZ(0);
  @$pb.TagNumber(1)
  set hour($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHour() => $_has(0);
  @$pb.TagNumber(1)
  void clearHour() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minute => $_getIZ(1);
  @$pb.TagNumber(2)
  set minute($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinute() => clearField(2);
}

class TimeRange extends $pb.GeneratedMessage {
  factory TimeRange({
    TimeOfDay? start,
    TimeOfDay? end,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  TimeRange._() : super();
  factory TimeRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOM<TimeOfDay>(1, _omitFieldNames ? '' : 'start', subBuilder: TimeOfDay.create)
    ..aOM<TimeOfDay>(2, _omitFieldNames ? '' : 'end', subBuilder: TimeOfDay.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeRange clone() => TimeRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeRange copyWith(void Function(TimeRange) updates) => super.copyWith((message) => updates(message as TimeRange)) as TimeRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeRange create() => TimeRange._();
  TimeRange createEmptyInstance() => create();
  static $pb.PbList<TimeRange> createRepeated() => $pb.PbList<TimeRange>();
  @$core.pragma('dart2js:noInline')
  static TimeRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeRange>(create);
  static TimeRange? _defaultInstance;

  @$pb.TagNumber(1)
  TimeOfDay get start => $_getN(0);
  @$pb.TagNumber(1)
  set start(TimeOfDay v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);
  @$pb.TagNumber(1)
  TimeOfDay ensureStart() => $_ensure(0);

  @$pb.TagNumber(2)
  TimeOfDay get end => $_getN(1);
  @$pb.TagNumber(2)
  set end(TimeOfDay v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
  @$pb.TagNumber(2)
  TimeOfDay ensureEnd() => $_ensure(1);
}

class Subject extends $pb.GeneratedMessage {
  factory Subject({
    $core.String? name,
    $core.String? room,
    Subject_SubjectType? type,
    Lecturer? lecturer,
    $core.int? number,
    TimeRange? timeRange,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (room != null) {
      $result.room = room;
    }
    if (type != null) {
      $result.type = type;
    }
    if (lecturer != null) {
      $result.lecturer = lecturer;
    }
    if (number != null) {
      $result.number = number;
    }
    if (timeRange != null) {
      $result.timeRange = timeRange;
    }
    return $result;
  }
  Subject._() : super();
  factory Subject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Subject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Subject', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..e<Subject_SubjectType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Subject_SubjectType.LECTURE, valueOf: Subject_SubjectType.valueOf, enumValues: Subject_SubjectType.values)
    ..aOM<Lecturer>(4, _omitFieldNames ? '' : 'lecturer', subBuilder: Lecturer.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'number', $pb.PbFieldType.O3)
    ..aOM<TimeRange>(6, _omitFieldNames ? '' : 'timeRange', protoName: 'timeRange', subBuilder: TimeRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Subject clone() => Subject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Subject copyWith(void Function(Subject) updates) => super.copyWith((message) => updates(message as Subject)) as Subject;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subject create() => Subject._();
  Subject createEmptyInstance() => create();
  static $pb.PbList<Subject> createRepeated() => $pb.PbList<Subject>();
  @$core.pragma('dart2js:noInline')
  static Subject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Subject>(create);
  static Subject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);

  @$pb.TagNumber(3)
  Subject_SubjectType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(Subject_SubjectType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  Lecturer get lecturer => $_getN(3);
  @$pb.TagNumber(4)
  set lecturer(Lecturer v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLecturer() => $_has(3);
  @$pb.TagNumber(4)
  void clearLecturer() => clearField(4);
  @$pb.TagNumber(4)
  Lecturer ensureLecturer() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get number => $_getIZ(4);
  @$pb.TagNumber(5)
  set number($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumber() => clearField(5);

  @$pb.TagNumber(6)
  TimeRange get timeRange => $_getN(5);
  @$pb.TagNumber(6)
  set timeRange(TimeRange v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimeRange() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimeRange() => clearField(6);
  @$pb.TagNumber(6)
  TimeRange ensureTimeRange() => $_ensure(5);
}

class Day extends $pb.GeneratedMessage {
  factory Day({
    $core.int? weekday,
    $core.Iterable<Subject>? subjects,
  }) {
    final $result = create();
    if (weekday != null) {
      $result.weekday = weekday;
    }
    if (subjects != null) {
      $result.subjects.addAll(subjects);
    }
    return $result;
  }
  Day._() : super();
  factory Day.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Day.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Day', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'weekday', $pb.PbFieldType.O3)
    ..pc<Subject>(2, _omitFieldNames ? '' : 'subjects', $pb.PbFieldType.PM, subBuilder: Subject.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Day clone() => Day()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Day copyWith(void Function(Day) updates) => super.copyWith((message) => updates(message as Day)) as Day;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Day create() => Day._();
  Day createEmptyInstance() => create();
  static $pb.PbList<Day> createRepeated() => $pb.PbList<Day>();
  @$core.pragma('dart2js:noInline')
  static Day getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Day>(create);
  static Day? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get weekday => $_getIZ(0);
  @$pb.TagNumber(1)
  set weekday($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWeekday() => $_has(0);
  @$pb.TagNumber(1)
  void clearWeekday() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Subject> get subjects => $_getList(1);
}

class ScheduleRequest extends $pb.GeneratedMessage {
  factory ScheduleRequest({
    $core.String? group,
  }) {
    final $result = create();
    if (group != null) {
      $result.group = group;
    }
    return $result;
  }
  ScheduleRequest._() : super();
  factory ScheduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'group')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleRequest clone() => ScheduleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleRequest copyWith(void Function(ScheduleRequest) updates) => super.copyWith((message) => updates(message as ScheduleRequest)) as ScheduleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRequest create() => ScheduleRequest._();
  ScheduleRequest createEmptyInstance() => create();
  static $pb.PbList<ScheduleRequest> createRepeated() => $pb.PbList<ScheduleRequest>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleRequest>(create);
  static ScheduleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get group => $_getSZ(0);
  @$pb.TagNumber(1)
  set group($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => clearField(1);
}

class ScheduleResponse extends $pb.GeneratedMessage {
  factory ScheduleResponse({
    $core.Iterable<Day>? oddWeek,
    $core.Iterable<Day>? evenWeek,
  }) {
    final $result = create();
    if (oddWeek != null) {
      $result.oddWeek.addAll(oddWeek);
    }
    if (evenWeek != null) {
      $result.evenWeek.addAll(evenWeek);
    }
    return $result;
  }
  ScheduleResponse._() : super();
  factory ScheduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScheduleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..pc<Day>(1, _omitFieldNames ? '' : 'oddWeek', $pb.PbFieldType.PM, protoName: 'oddWeek', subBuilder: Day.create)
    ..pc<Day>(2, _omitFieldNames ? '' : 'evenWeek', $pb.PbFieldType.PM, protoName: 'evenWeek', subBuilder: Day.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleResponse clone() => ScheduleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleResponse copyWith(void Function(ScheduleResponse) updates) => super.copyWith((message) => updates(message as ScheduleResponse)) as ScheduleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleResponse create() => ScheduleResponse._();
  ScheduleResponse createEmptyInstance() => create();
  static $pb.PbList<ScheduleResponse> createRepeated() => $pb.PbList<ScheduleResponse>();
  @$core.pragma('dart2js:noInline')
  static ScheduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleResponse>(create);
  static ScheduleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Day> get oddWeek => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Day> get evenWeek => $_getList(1);
}

class Retake extends $pb.GeneratedMessage {
  factory Retake({
    $core.String? name,
    $core.String? room,
    Lecturer? lecturer,
    $core.int? number,
    TimeRange? timeRange,
    $1.Timestamp? date,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (room != null) {
      $result.room = room;
    }
    if (lecturer != null) {
      $result.lecturer = lecturer;
    }
    if (number != null) {
      $result.number = number;
    }
    if (timeRange != null) {
      $result.timeRange = timeRange;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  Retake._() : super();
  factory Retake.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Retake.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Retake', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'room')
    ..aOM<Lecturer>(3, _omitFieldNames ? '' : 'lecturer', subBuilder: Lecturer.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'number', $pb.PbFieldType.O3)
    ..aOM<TimeRange>(5, _omitFieldNames ? '' : 'timeRange', protoName: 'timeRange', subBuilder: TimeRange.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'date', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Retake clone() => Retake()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Retake copyWith(void Function(Retake) updates) => super.copyWith((message) => updates(message as Retake)) as Retake;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Retake create() => Retake._();
  Retake createEmptyInstance() => create();
  static $pb.PbList<Retake> createRepeated() => $pb.PbList<Retake>();
  @$core.pragma('dart2js:noInline')
  static Retake getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Retake>(create);
  static Retake? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get room => $_getSZ(1);
  @$pb.TagNumber(2)
  set room($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);

  @$pb.TagNumber(3)
  Lecturer get lecturer => $_getN(2);
  @$pb.TagNumber(3)
  set lecturer(Lecturer v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);
  @$pb.TagNumber(3)
  void clearLecturer() => clearField(3);
  @$pb.TagNumber(3)
  Lecturer ensureLecturer() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get number => $_getIZ(3);
  @$pb.TagNumber(4)
  set number($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumber() => clearField(4);

  @$pb.TagNumber(5)
  TimeRange get timeRange => $_getN(4);
  @$pb.TagNumber(5)
  set timeRange(TimeRange v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimeRange() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeRange() => clearField(5);
  @$pb.TagNumber(5)
  TimeRange ensureTimeRange() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get date => $_getN(5);
  @$pb.TagNumber(6)
  set date($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDate() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureDate() => $_ensure(5);
}

class RetakesRequest extends $pb.GeneratedMessage {
  factory RetakesRequest({
    $core.String? group,
  }) {
    final $result = create();
    if (group != null) {
      $result.group = group;
    }
    return $result;
  }
  RetakesRequest._() : super();
  factory RetakesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RetakesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RetakesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'group')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RetakesRequest clone() => RetakesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RetakesRequest copyWith(void Function(RetakesRequest) updates) => super.copyWith((message) => updates(message as RetakesRequest)) as RetakesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetakesRequest create() => RetakesRequest._();
  RetakesRequest createEmptyInstance() => create();
  static $pb.PbList<RetakesRequest> createRepeated() => $pb.PbList<RetakesRequest>();
  @$core.pragma('dart2js:noInline')
  static RetakesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RetakesRequest>(create);
  static RetakesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get group => $_getSZ(0);
  @$pb.TagNumber(1)
  set group($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => clearField(1);
}

class RetakesResponse extends $pb.GeneratedMessage {
  factory RetakesResponse({
    $core.Iterable<Retake>? retakes,
  }) {
    final $result = create();
    if (retakes != null) {
      $result.retakes.addAll(retakes);
    }
    return $result;
  }
  RetakesResponse._() : super();
  factory RetakesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RetakesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RetakesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'csu'), createEmptyInstance: create)
    ..pc<Retake>(1, _omitFieldNames ? '' : 'retakes', $pb.PbFieldType.PM, subBuilder: Retake.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RetakesResponse clone() => RetakesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RetakesResponse copyWith(void Function(RetakesResponse) updates) => super.copyWith((message) => updates(message as RetakesResponse)) as RetakesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetakesResponse create() => RetakesResponse._();
  RetakesResponse createEmptyInstance() => create();
  static $pb.PbList<RetakesResponse> createRepeated() => $pb.PbList<RetakesResponse>();
  @$core.pragma('dart2js:noInline')
  static RetakesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RetakesResponse>(create);
  static RetakesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Retake> get retakes => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

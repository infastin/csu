//
//  Generated code. Do not modify.
//  source: csu.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'csu.pb.dart' as $0;

export 'csu.pb.dart';

@$pb.GrpcServiceName('csu.Service')
class ServiceClient extends $grpc.Client {
  static final _$getSchedule = $grpc.ClientMethod<$0.ScheduleRequest, $0.ScheduleResponse>(
      '/csu.Service/GetSchedule',
      ($0.ScheduleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ScheduleResponse.fromBuffer(value));
  static final _$getRetakes = $grpc.ClientMethod<$0.RetakesRequest, $0.RetakesResponse>(
      '/csu.Service/GetRetakes',
      ($0.RetakesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RetakesResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ScheduleResponse> getSchedule($0.ScheduleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSchedule, request, options: options);
  }

  $grpc.ResponseFuture<$0.RetakesResponse> getRetakes($0.RetakesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRetakes, request, options: options);
  }
}

@$pb.GrpcServiceName('csu.Service')
abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'csu.Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ScheduleRequest, $0.ScheduleResponse>(
        'GetSchedule',
        getSchedule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ScheduleRequest.fromBuffer(value),
        ($0.ScheduleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RetakesRequest, $0.RetakesResponse>(
        'GetRetakes',
        getRetakes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RetakesRequest.fromBuffer(value),
        ($0.RetakesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ScheduleResponse> getSchedule_Pre($grpc.ServiceCall call, $async.Future<$0.ScheduleRequest> request) async {
    return getSchedule(call, await request);
  }

  $async.Future<$0.RetakesResponse> getRetakes_Pre($grpc.ServiceCall call, $async.Future<$0.RetakesRequest> request) async {
    return getRetakes(call, await request);
  }

  $async.Future<$0.ScheduleResponse> getSchedule($grpc.ServiceCall call, $0.ScheduleRequest request);
  $async.Future<$0.RetakesResponse> getRetakes($grpc.ServiceCall call, $0.RetakesRequest request);
}

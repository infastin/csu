import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grpc/grpc.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import '../entity/entity.dart';

enum GrpcErrorCode {
  ok(code: 0),
  cancelled(code: 1),
  unknown(code: 2),
  invalidArgument(code: 3),
  deadlineExceeded(code: 4),
  notFound(code: 5),
  alreadyExists(code: 6),
  permissionDenied(code: 7),
  resourceExhausted(code: 8),
  failedPrecondition(code: 9),
  aborted(code: 10),
  outOfRange(code: 11),
  unimplemented(code: 12),
  internal(code: 13),
  unavailable(code: 14),
  dataLoss(code: 15),
  unauthenticated(code: 16);

  const GrpcErrorCode({required this.code});

  factory GrpcErrorCode.fromCode(int code) {
    return switch (code) {
      0 => ok,
      1 => cancelled,
      2 => unknown,
      3 => invalidArgument,
      4 => deadlineExceeded,
      5 => notFound,
      6 => alreadyExists,
      7 => permissionDenied,
      8 => resourceExhausted,
      9 => failedPrecondition,
      10 => aborted,
      11 => outOfRange,
      12 => unimplemented,
      13 => internal,
      14 => unavailable,
      15 => dataLoss,
      16 => unauthenticated,
      _ => unknown,
    };
  }

  final int code;

  String localize(AppLocalizations loc) {
    return switch (this) {
      ok => loc.grpcOk,
      cancelled => loc.grpcCancelled,
      unknown => loc.unknown,
      invalidArgument => loc.grpcInvalidArgument,
      deadlineExceeded => loc.grpcDeadlineExceeded,
      notFound => loc.grpcNotFound,
      alreadyExists => loc.grpcAlreadyExists,
      permissionDenied => loc.grpcPermissionDenied,
      resourceExhausted => loc.grpcResourceExhausted,
      failedPrecondition => loc.grpcFailedPrecondition,
      aborted => loc.grpcAborted,
      outOfRange => loc.grpcOutOfRange,
      unimplemented => loc.grpcUnimplemented,
      internal => loc.grpcInternal,
      unavailable => loc.grpcUnavailable,
      dataLoss => loc.grpcDataLoss,
      unauthenticated => loc.grpcUnauthenticated,
    };
  }
}

enum GrpcProviderErrorCode {
  ok(code: 0),
  unknown(code: 1),
  couldNotGetSchedule(code: 2),
  couldNotGetRetakes(code: 3);

  const GrpcProviderErrorCode({required this.code});

  factory GrpcProviderErrorCode.fromCode(int code) {
    return switch (code) {
      0 => ok,
      1 => unknown,
      2 => couldNotGetSchedule,
      3 => couldNotGetRetakes,
      _ => unknown,
    };
  }

  final int code;

  String localize(AppLocalizations loc) {
    return switch (this) {
      ok => loc.grpcOk,
      unknown => loc.grpcUnknown,
      couldNotGetSchedule => loc.grpcCouldNotGetSchedule,
      couldNotGetRetakes => loc.grpcCouldNotGetRetakes,
    };
  }
}

enum GrpcErrorMessage {
  none(message: "none"),
  unknown(message: "unknown"),
  noSuchGroup(message: "no such group");

  const GrpcErrorMessage({required this.message});

  factory GrpcErrorMessage.fromMessage(String? message) {
    return switch (message) {
      null => none,
      "no such group" => noSuchGroup,
      _ => unknown,
    };
  }

  String localize(AppLocalizations loc) {
    return switch (this) {
      none => "",
      unknown => loc.grpcUnknown,
      noSuchGroup => loc.grpcNoSuchGroup,
    };
  }

  final String message;
}

class GrpcException implements Exception {
  GrpcException({
    required this.grpcCode,
    required this.providerCode,
    required this.message,
  });

  final GrpcErrorCode grpcCode;
  final GrpcProviderErrorCode providerCode;
  final GrpcErrorMessage message;

  @override
  String toString() =>
    "GRPC Exception (code: $grpcCode, providerCode: $providerCode, message: $message)";

  String localize(AppLocalizations loc) {
    if (message == GrpcErrorMessage.none || message == GrpcErrorMessage.none) {
      return "${providerCode.localize(loc)}: ${grpcCode.localize(loc)}";
    } else {
      return "${providerCode.localize(loc)}: ${message.localize(loc)}";
    }
  }
}

class GrpcProvider {
  GrpcProvider() {
    _channel = ClientChannel(
      appConfig.grpcHost,
      port: appConfig.grpcPort,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()])
      )
    );

    _stub = pb.ServiceClient(_channel);
  }

  late final ClientChannel _channel;
  late final pb.ServiceClient _stub;

  Future<ScheduleEntity> getSchedule(String group) async {
    try {
      final scheduleDTO = await _stub.getSchedule(
        pb.ScheduleRequest(group: group),
        options: CallOptions(compression: const GzipCodec())
      );
      return ScheduleEntity.fromPb(scheduleDTO);
    } on GrpcError catch (e) {
      throw GrpcException(
        grpcCode: GrpcErrorCode.fromCode(e.code),
        providerCode: GrpcProviderErrorCode.couldNotGetSchedule,
        message: GrpcErrorMessage.fromMessage(e.message),
      );
    }
  }

  Future<RetakesEntity> getRetakes(String group) async {
    try {
      final retakesDTO = await _stub.getRetakes(
        pb.RetakesRequest(group: group),
        options: CallOptions(compression: const GzipCodec())
      );
      return RetakesEntity.fromPb(retakesDTO);
    } on GrpcError catch (e) {
      throw GrpcException(
        grpcCode: GrpcErrorCode.fromCode(e.code),
        providerCode: GrpcProviderErrorCode.couldNotGetRetakes,
        message: GrpcErrorMessage.fromMessage(e.message),
      );
    }
  }

  Future<void> close() async {
    await _channel.shutdown();
  }
}

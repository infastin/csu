import 'package:grpc/grpc.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import '../entity/entity.dart';

class Grpc {
  Grpc({required String host, required int port}) {
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()])
      )
    );

    _stub = pb.ServiceClient(_channel);
  }

  late final ClientChannel _channel;
  late final pb.ServiceClient _stub;

  Future<ScheduleEntity?> getSchedule(String group) async {
    try {
      final scheduleDTO = await _stub.getSchedule(
        pb.ScheduleRequest(group: group),
        options: CallOptions(compression: const GzipCodec())
      );
      return ScheduleEntity.fromPb(scheduleDTO);
    } catch (_) {
      return null;
    }
  }

  Future<RetakesEntity?> getRetakes(String group) async {
    try {
      final retakesDTO = await _stub.getRetakes(
        pb.RetakesRequest(group: group),
        options: CallOptions(compression: const GzipCodec())
      );
      return RetakesEntity.fromPb(retakesDTO);
    } catch (_) {
      return null;
    }
  }

  Future<void> close() async {
    return await _channel.shutdown();
  }
}

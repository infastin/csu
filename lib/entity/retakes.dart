import 'retake.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

class RetakesEntity {
  const RetakesEntity({
    required this.retakes,
  });

  factory RetakesEntity.fromPb(pb.RetakesResponse retakes) {
    var retakesList = <RetakeEntity>[];
    for (final retake in retakes.retakes) {
      retakesList.add(RetakeEntity.fromPb(retake));
    }
    return RetakesEntity(retakes: retakesList);
  }

  final List<RetakeEntity> retakes;
}

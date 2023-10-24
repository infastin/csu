import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

import 'retake.dart';

part 'retakes.g.dart';

@JsonSerializable()
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

  factory RetakesEntity.fromJson(Map<String, dynamic> json) => _$RetakesEntityFromJson(json);

  final List<RetakeEntity> retakes;

  Map<String, dynamic> toJson() => _$RetakesEntityToJson(this);
}

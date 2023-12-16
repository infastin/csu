import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

part 'groups.g.dart';

@JsonSerializable()
class GroupsEntity {
  const GroupsEntity({ required this.groups });

  factory GroupsEntity.fromPb(pb.GroupsResponse resp) => GroupsEntity(groups: resp.groups);

  factory GroupsEntity.fromJson(Map<String, dynamic> json) => _$GroupsEntityFromJson(json);

  final List<String> groups;

  Map<String, dynamic> toJson() => _$GroupsEntityToJson(this);
}

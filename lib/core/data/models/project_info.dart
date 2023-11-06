import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qdamono_fluent/core/data/models/privilege_level.dart';

part 'project_info.freezed.dart';
part 'project_info.g.dart';

@freezed
class ProjectInfo with _$ProjectInfo {
  const factory ProjectInfo({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'privilege') required PrivilegeLevel privilegeLevel,
  }) = _ProjectInfo;

  factory ProjectInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoFromJson(json);
}

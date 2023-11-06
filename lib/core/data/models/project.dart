import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'textFiles') required List<String> files,
    @JsonKey(name: 'codes') required List<String> codes,
    @JsonKey(name: 'notes') required List<String> notes,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

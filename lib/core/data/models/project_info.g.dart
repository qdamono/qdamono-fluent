// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectInfoImpl _$$ProjectInfoImplFromJson(Map<String, dynamic> json) =>
    _$ProjectInfoImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      privilegeLevel: $enumDecode(_$PrivilegeLevelEnumMap, json['privilege']),
    );

Map<String, dynamic> _$$ProjectInfoImplToJson(_$ProjectInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'privilege': _$PrivilegeLevelEnumMap[instance.privilegeLevel]!,
    };

const _$PrivilegeLevelEnumMap = {
  PrivilegeLevel.unauthorized: 'unauthorized',
  PrivilegeLevel.guest: 'guest',
  PrivilegeLevel.contributor: 'contributor',
  PrivilegeLevel.maintainer: 'maintainer',
  PrivilegeLevel.owner: 'owner',
};

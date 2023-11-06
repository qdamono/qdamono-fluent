// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      files:
          (json['textFiles'] as List<dynamic>).map((e) => e as String).toList(),
      codes: (json['codes'] as List<dynamic>).map((e) => e as String).toList(),
      notes: (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'textFiles': instance.files,
      'codes': instance.codes,
      'notes': instance.notes,
    };

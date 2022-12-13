// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  utils.Status.on: 'on',
  utils.Status.off: 'off',
};

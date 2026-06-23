// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sunc_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuncTest _$SuncTestFromJson(Map<String, dynamic> json) => _SuncTest(
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  library: json['library'] as String? ?? 'Other',
  status: json['status'] as String? ?? 'unknown',
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$SuncTestToJson(_SuncTest instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'library': instance.library,
  'status': instance.status,
  'reason': instance.reason,
};

_SuncData _$SuncDataFromJson(Map<String, dynamic> json) => _SuncData(
  timestamp: json['timestamp'] == null
      ? 0.0
      : SuncData._parseDouble(json['timestamp']),
  version: json['version'] as String? ?? '—',
  timeTaken: json['timeTaken'] == null
      ? 0.0
      : SuncData._parseDouble(json['timeTaken']),
  executor: json['executor'] as String? ?? '—',
  outdated: json['outdated'] as bool? ?? false,
  bibip: json['bibip'] as bool? ?? false,
  passed:
      (SuncData._readPassedTests(json, 'passed') as List<dynamic>?)
          ?.map((e) => SuncTest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  failed:
      (SuncData._readFailedTests(json, 'failed') as List<dynamic>?)
          ?.map((e) => SuncTest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SuncDataToJson(_SuncData instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'version': instance.version,
  'timeTaken': instance.timeTaken,
  'executor': instance.executor,
  'outdated': instance.outdated,
  'bibip': instance.bibip,
  'passed': instance.passed,
  'failed': instance.failed,
};

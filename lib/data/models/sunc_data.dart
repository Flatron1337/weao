import 'package:freezed_annotation/freezed_annotation.dart';

part 'sunc_data.freezed.dart';
part 'sunc_data.g.dart';

@freezed
abstract class SuncTest with _$SuncTest {
  const factory SuncTest({
    @Default('') String name,
    @Default('') String description,
    @Default('Other') String library,
    @Default('unknown') String status,
    String? reason,
  }) = _SuncTest;
  const SuncTest._();

  bool get isPassed => status == 'passed';
  bool get isFailed => status == 'failed';

  factory SuncTest.fromJson(Map<String, Object?> json) =>
      _$SuncTestFromJson(json);
}

@freezed
abstract class SuncData with _$SuncData {
  const factory SuncData({
    @JsonKey(fromJson: SuncData._parseDouble) @Default(0.0) double timestamp,
    @Default('—') String version,
    @JsonKey(fromJson: SuncData._parseDouble) @Default(0.0) double timeTaken,
    @Default('—') String executor,
    @Default(false) bool outdated,
    @Default(false) bool bibip,
    @JsonKey(readValue: SuncData._readPassedTests)
    @Default([])
    List<SuncTest> passed,
    @JsonKey(readValue: SuncData._readFailedTests)
    @Default([])
    List<SuncTest> failed,
  }) = _SuncData;
  const SuncData._();

  List<SuncTest> get allTests => [...passed, ...failed];

  factory SuncData.fromJson(Map<String, Object?> json) =>
      _$SuncDataFromJson(json);

  static double _parseDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static Object? _readPassedTests(Map<dynamic, dynamic> json, String key) {
    final tests = json['tests'];
    if (tests is Map && tests['passed'] != null) return tests['passed'];
    return json[key];
  }

  static Object? _readFailedTests(Map<dynamic, dynamic> json, String key) {
    final tests = json['tests'];
    if (tests is Map && tests['failed'] != null) return tests['failed'];
    return json[key];
  }
}

@freezed
abstract class SuncRequest with _$SuncRequest {
  const factory SuncRequest({required String scrap, required String key}) =
      _SuncRequest;
  const SuncRequest._();

  bool get isValid => scrap.isNotEmpty && key.isNotEmpty;
}

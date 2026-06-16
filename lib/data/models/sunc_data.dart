class SuncTest {
  const SuncTest({
    required this.name,
    required this.description,
    required this.library,
    required this.status,
    this.reason,
  });

  final String name;
  final String description;
  final String library;
  final String status;
  final String? reason;

  bool get isPassed => status == 'passed';
  bool get isFailed => status == 'failed';

  factory SuncTest.fromJson(Map<String, dynamic> json) {
    return SuncTest(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      library: json['library'] as String? ?? 'Other',
      status: json['status'] as String? ?? 'unknown',
      reason: json['reason'] as String?,
    );
  }
}

class SuncData {
  const SuncData({
    required this.timestamp,
    required this.version,
    required this.timeTaken,
    required this.executor,
    required this.outdated,
    required this.passed,
    required this.failed,
    this.bibip = false,
  });

  final double timestamp;
  final String version;
  final double timeTaken;
  final String executor;
  final bool outdated;
  final bool bibip;
  final List<SuncTest> passed;
  final List<SuncTest> failed;

  List<SuncTest> get allTests => [...passed, ...failed];

  factory SuncData.fromJson(Map<String, dynamic> json) {
    final tests = json['tests'];
    final passed = <SuncTest>[];
    final failed = <SuncTest>[];

    if (tests is Map) {
      final passedRaw = tests['passed'];
      final failedRaw = tests['failed'];
      if (passedRaw is List) {
        for (final item in passedRaw) {
          if (item is Map) {
            passed.add(SuncTest.fromJson(Map<String, dynamic>.from(item)));
          }
        }
      }
      if (failedRaw is List) {
        for (final item in failedRaw) {
          if (item is Map) {
            failed.add(SuncTest.fromJson(Map<String, dynamic>.from(item)));
          }
        }
      }
    }

    return SuncData(
      timestamp: (json['timestamp'] as num?)?.toDouble() ?? 0,
      version: json['version'] as String? ?? '—',
      timeTaken: (json['timeTaken'] as num?)?.toDouble() ?? 0,
      executor: json['executor'] as String? ?? '—',
      outdated: json['outdated'] as bool? ?? false,
      bibip: json['bibip'] as bool? ?? false,
      passed: passed,
      failed: failed,
    );
  }

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'version': version,
        'timeTaken': timeTaken,
        'executor': executor,
        'outdated': outdated,
        'bibip': bibip,
        'tests': {
          'passed': passed
              .map(
                (t) => {
                  'name': t.name,
                  'description': t.description,
                  'library': t.library,
                  'status': t.status,
                },
              )
              .toList(),
          'failed': failed
              .map(
                (t) => {
                  'name': t.name,
                  'description': t.description,
                  'library': t.library,
                  'status': t.status,
                  if (t.reason != null) 'reason': t.reason,
                },
              )
              .toList(),
        },
      };
}

class SuncRequest {
  const SuncRequest({required this.scrap, required this.key});

  final String scrap;
  final String key;

  bool get isValid => scrap.isNotEmpty && key.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      other is SuncRequest && other.scrap == scrap && other.key == key;

  @override
  int get hashCode => Object.hash(scrap, key);
}

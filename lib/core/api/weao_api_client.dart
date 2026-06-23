import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../errors/weao_exception.dart';
import '../l10n/app_strings.dart';
import '../utils/app_logger.dart';

/// Base URL of the WEAO API. Override at build time with
/// `--dart-define=WEAO_API_BASE_URL=https://...`.
const _apiBaseUrl = String.fromEnvironment(
  'WEAO_API_BASE_URL',
  defaultValue: 'https://weao.xyz',
);

/// User-Agent sent to the WEAO API. Override at build time with
/// `--dart-define=WEAO_USER_AGENT=...`.
const _apiUserAgent = String.fromEnvironment(
  'WEAO_USER_AGENT',
  defaultValue: 'WEAO-3PService',
);

class WeaoApiClient {
  WeaoApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: _apiBaseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              headers: const {'User-Agent': _apiUserAgent},
            ),
          ) {
    if (dio == null) {
      _dio.interceptors.add(
        RetryInterceptor(
          dio: _dio,
          logPrint: AppLogger.debug,
          retryDelays: const [
            Duration(seconds: 1),
            Duration(seconds: 2),
            Duration(seconds: 3),
          ],
        ),
      );
      _dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
    }
  }

  final Dio _dio;

  /// GET that returns the response body as a JSON object.
  Future<Map<String, dynamic>> getJsonObject(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final data = await getRaw(path, queryParameters: queryParameters);
    if (data is! Map<String, dynamic>) {
      throw WeaoException('Invalid response: expected JSON object');
    }
    return data;
  }

  /// GET that returns the response body as a JSON array.
  Future<List<dynamic>> getJsonList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final data = await getRaw(path, queryParameters: queryParameters);
    if (data is! List) {
      throw WeaoException('Invalid response: expected JSON array');
    }
    return data;
  }

  /// Low-level GET returning the decoded body as-is. Prefer [getJsonObject]
  /// and [getJsonList] in call sites so types are checked centrally.
  Future<dynamic> getRaw(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e, st) {
      AppLogger.warning(
        'Dio request failed: ${e.requestOptions.path}',
        error: e,
        stackTrace: st,
      );
      throw _mapException(e);
    }
  }

  WeaoException _mapException(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    if (statusCode == 429 && data is Map) {
      final rateLimitInfo = data['rateLimitInfo'];
      if (rateLimitInfo is Map) {
        final remaining = rateLimitInfo['remainingTime'];
        final seconds = remaining is num ? remaining.ceil() : 60;
        return WeaoException(
          AppStrings.rateLimitMessage(seconds),
          kind: WeaoExceptionKind.rateLimited,
          remainingSeconds: seconds,
        );
      }
      return WeaoException(
        AppStrings.rateLimitGeneric,
        kind: WeaoExceptionKind.rateLimited,
      );
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return WeaoException(
        AppStrings.timeoutError,
        kind: WeaoExceptionKind.timeout,
      );
    }

    if (e.type == DioExceptionType.connectionError) {
      return WeaoException(
        AppStrings.noConnection,
        kind: WeaoExceptionKind.noConnection,
      );
    }

    return WeaoException(AppStrings.genericError);
  }
}

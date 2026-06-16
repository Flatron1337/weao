import 'package:dio/dio.dart';

import '../errors/weao_exception.dart';

class WeaoApiClient {
  WeaoApiClient({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://weao.xyz',
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                headers: const {'User-Agent': 'WEAO-3PService'},
              ),
            );

  final Dio _dio;

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
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
          'Слишком много запросов. Повторите через $seconds сек.',
          remainingSeconds: seconds,
        );
      }
      return WeaoException('Слишком много запросов. Повторите позже.');
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return WeaoException('Превышено время ожидания ответа');
    }

    if (e.type == DioExceptionType.connectionError) {
      return WeaoException('Нет подключения к интернету');
    }

    return WeaoException('Не удалось загрузить данные');
  }
}

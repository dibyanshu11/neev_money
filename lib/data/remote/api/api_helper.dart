import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/remote/api/dio_client.dart';
import 'package:new_app/domain/entity/app_failure.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper _instance = ApiHelper._();
  factory ApiHelper() => _instance;

  Dio get _dio => DioClient().dio;

  Future<Either<AppFailure, Response>> get(String path,
      {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return right(response);
    } on DioException catch (e) {
      return left(_handleError(e));
    } catch (_) {
      return left(const AppFailure.unknown());
    }
  }

  Future<Either<AppFailure, Response>> post(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      return right(response);
    } on DioException catch (e) {
      return left(_handleError(e));
    } catch (_) {
      return left(const AppFailure.unknown());
    }
  }

  AppFailure _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const AppFailure.connectionFailure();
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        if (status == 401) return const AppFailure.unauthorized();
        if (status == 404) return const AppFailure.notFound();
        final message =
            e.response?.data?['message']?.toString() ?? 'Server error';
        return AppFailure.serverError(message);
      default:
        return const AppFailure.unknown();
    }
  }
}

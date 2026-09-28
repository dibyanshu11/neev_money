import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/network/internet_checker.dart';
import 'package:new_app/data/models/api_response.dart';
import 'package:new_app/core/network/dio_client.dart';
import 'package:new_app/core/errors/app_failure.dart';

enum MethodRequest {
  get,
  post,
  put,
  patch,
  delete,
  multipart,
}

/// Data-layer HTTP client (Dahn style).
///
/// Clean architecture: repositories / connect helpers call [makeRequest] only.
/// Do not add get/post/put wrappers here — pick [MethodRequest] at the call site.
class ApiRequests {
  ApiRequests._();
  static final ApiRequests _instance = ApiRequests._();
  factory ApiRequests() => _instance;

  Dio get _dio => DioClient().dio;

  Future<Either<AppFailure, ApiResponse>> makeRequest({
    required MethodRequest method,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? filePath,
    String? fileField,
    List<MapEntry<String, String>>? files,
    ProgressCallback? onSendProgress,
  }) async {
    final hasInternet = await InternetChecker().checkInternetConnectivity();
    if (!hasInternet) {
      _log('--> else case --> No internet connection');
      return left(const AppFailure.connectionFailure());
    }

    try {
      final options = Options(
        headers: headers,
        validateStatus: (_) => true,
      );
      late final Response response;

      switch (method) {
        case MethodRequest.get:
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: options,
          );
        case MethodRequest.post:
          response = await _dio.post(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case MethodRequest.put:
          response = await _dio.put(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case MethodRequest.patch:
          response = await _dio.patch(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case MethodRequest.delete:
          response = await _dio.delete(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case MethodRequest.multipart:
          final formData = await _buildFormData(
            data: data,
            filePath: filePath,
            fileField: fileField,
            files: files,
          );
          response = await _dio.post(
            path,
            data: formData,
            queryParameters: queryParameters,
            options: options,
            onSendProgress: onSendProgress,
          );
      }

      _log(
        'apiUri => ${response.requestOptions.uri}\n'
        'data: => $data\n'
        'field: $fileField\n'
        'filePath: $filePath\n'
        'files: ${files?.length}\n'
        'statusCode: ${response.statusCode}\n'
        'responseHeaders: => ${response.headers.map}\n'
        'response: => ${response.data}',
      );

      return returnResponse(response);
    } on DioException catch (e) {
      _log(
        '===== API ERROR =====\n'
        'method: ${method.name.toUpperCase()}\n'
        'url: ${e.requestOptions.uri}\n'
        'path: $path\n'
        'data: $data\n'
        'statusCode: ${e.response?.statusCode}\n'
        'responseHeaders: ${e.response?.headers.map}\n'
        'response: ${e.response?.data}\n'
        'error: ${e.message}\n'
        '=====================',
      );

      if (e.response != null) {
        return returnResponse(e.response!);
      }

      return left(_mapDioException(e));
    } catch (e, st) {
      _log('Unknown error on $path: $e\n$st');
      return left(const AppFailure.unknown());
    }
  }

  Future<FormData> _buildFormData({
    dynamic data,
    String? filePath,
    String? fileField,
    List<MapEntry<String, String>>? files,
  }) async {
    final map = <String, dynamic>{};

    if (data is Map<String, dynamic>) {
      data.forEach((key, value) {
        if (value != null) map[key] = value;
      });
    }

    if (filePath != null &&
        filePath.isNotEmpty &&
        fileField != null &&
        fileField.isNotEmpty) {
      if (!await _hasValidUploadFile(filePath)) {
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Invalid file. Please try again.',
          type: DioExceptionType.unknown,
        );
      }
      map[fileField] = await MultipartFile.fromFile(
        filePath,
        filename: filePath.split(Platform.pathSeparator).last,
      );
    }

    if (files != null) {
      for (final entry in files) {
        if (entry.value.isEmpty) continue;
        if (!await _hasValidUploadFile(entry.value)) {
          throw DioException(
            requestOptions: RequestOptions(path: ''),
            error: 'Invalid file. Please try again.',
            type: DioExceptionType.unknown,
          );
        }
        map[entry.key] = await MultipartFile.fromFile(
          entry.value,
          filename: entry.value.split(Platform.pathSeparator).last,
        );
      }
    }

    return FormData.fromMap(map);
  }

  Future<bool> _hasValidUploadFile(String path) async {
    final file = File(path);
    if (!await file.exists()) return false;
    return await file.length() > 0;
  }

  AppFailure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
        return const AppFailure.connectionFailure();
      default:
        if (e.error is String) {
          return AppFailure.serverError(e.error! as String);
        }
        return const AppFailure.unknown();
    }
  }

  void _log(String message) {
    developer.log(message, name: 'ApiRequests');
  }
}

/// Dahn-style response mapper — success → [ApiResponse], else → [AppFailure].
Either<AppFailure, ApiResponse> returnResponse(Response response) {
  final localBody = response.data;

  String message = '';
  if (localBody is Map) {
    message = (localBody['returnMessage'] ?? localBody['message'] ?? '')
        .toString();

    final errors = localBody['errors'];
    if (errors is Map && errors.isNotEmpty) {
      final first = errors.values.first;
      if (first is List && first.isNotEmpty) {
        message = first.first.toString();
      } else if (first is String && first.isNotEmpty) {
        message = first;
      }
    }
  }

  return switch (response.statusCode) {
    200 || 201 || 204 => right(
        ApiResponse(
          data: localBody,
          message: message,
          hasError: false,
          statusCode: response.statusCode ?? 200,
        ),
      ),
    401 => left(const AppFailure.unauthorized()),
    404 => left(const AppFailure.notFound()),
    _ => left(
        AppFailure.serverError(
          message.isNotEmpty
              ? message
              : 'Something went wrong. Please try again.',
        ),
      ),
  };
}

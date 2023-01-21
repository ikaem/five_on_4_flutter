import 'dart:io';

import 'package:dio/dio.dart';
import 'package:five_on_4_flutter/src/domain/domain.dart' show HttpMethod;
import 'package:five_on_4_flutter/src/domain/exceptions/http_exceptions.dart'
    show
        HttpException,
        HttpUnknownException,
        HttpUnathorizedException,
        HttpInternalServerException,
        HttpNotFoundException;
import 'package:five_on_4_flutter/src/domain/values/http_request/http_request.dart';

class HttpWrapper {
  // TODO add interceptors when needed
  final Dio _dio = Dio();

  Future<T> get<T>({
    required HttpRequestUriValue restArgs,
  }) async {
    final Uri uri = Uri(
      scheme: restArgs.apiUrlScheme,
      host: restArgs.apiBaseUrl,
      path: '${restArgs.apiContextPath}/${restArgs.apiEndpointPath}',
      queryParameters: restArgs.queryParameters,
    );

    final HttpRequestMakeValue makeArgs = HttpRequestMakeValue(
      uri: uri,
      // TODO possibly we can only pass method as get
      method: HttpMethod.get,
    );

    final Response<T> response = await _makeRequest<T>(makeArgs);

    final T? data = response.data;

    if (data == null) {
      throw const HttpNotFoundException(message: 'Data not found');
    }

    return data;
  }

  Future<Response<T>> _makeRequest<T>(
    HttpRequestMakeValue args,
  ) async {
    // TODO add interceptors here when auth is implemented
    try {
      final Response<T> response = await _dio.requestUri<T>(
        args.uri,
        // TODO not sure if we will need options field here
        data: args.data,
        options: Options(
          method: args.method.name,
        ),
      );

      // TODO potentially should check here for responses as well

      return response;
    } catch (e) {
      // TODO use some logger here - http wrapper should accept app logger
      final Object exception = e;

      if (exception is! DioError) {
        throw HttpUnknownException(message: exception.toString());
      }

      final Response<dynamic>? response = exception.response;

      if (response == null) {
        throw HttpUnknownException(message: exception.toString());
      }

      final int? statusCode = response.statusCode;

      if (statusCode == null) {
        throw HttpUnknownException(message: exception.toString());
      }

      if (statusCode == HttpStatus.internalServerError) {
        throw HttpInternalServerException(message: exception.toString());
      }

      if (statusCode == HttpStatus.unauthorized) {
        throw HttpUnathorizedException(message: exception.message);
      }

      if (statusCode == HttpStatus.notFound) {
        throw HttpNotFoundException(message: exception.message);
      }

      throw HttpException(message: exception.message, statusCode: statusCode);
    }
  }
}

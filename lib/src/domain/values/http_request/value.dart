// TODO potentially would be good to use freezed at some point, for copy with and equality purposes

import 'package:five_on_4_flutter/src/domain/domain.dart' show HttpMethod;
import 'package:flutter/material.dart';

@immutable
class HttpRequestUriValue {
  const HttpRequestUriValue({
    required this.apiUrlScheme,
    required this.apiBaseUrl,
    required this.apiContextPath,
    required this.apiEndpointPath,
    required this.queryParameters,
  });

  final String apiUrlScheme;
  final String apiBaseUrl;
  final String apiContextPath;
  final String apiEndpointPath;
  final Map<String, String>? queryParameters;
}

@immutable
class HttpRequestMakeValue {
  const HttpRequestMakeValue({
    required this.uri,
    required this.method,
    this.data,
  });

  final Uri uri;
  final HttpMethod method;
  final dynamic data;
}

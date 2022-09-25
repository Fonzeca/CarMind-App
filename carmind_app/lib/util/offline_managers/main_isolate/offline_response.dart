import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

abstract class OfflineResponse {}

class OfflineResponseBody extends ResponseBody implements OfflineResponse {

  OfflineResponseBody(
    Stream<Uint8List> stream,
    int statusCode, {
    required Map<String, List<String>> headers,
    String? statusMessage,
    required bool isRedirect,
    List<RedirectRecord>? redirects,
  }) : super(
          stream,
          statusCode,
          headers: headers,
          statusMessage: statusMessage,
          isRedirect: isRedirect,
          redirects: redirects,
        );

  static OfflineResponseBody from(
    String text,
    int statusCode, {
    required Map<String, List<String>> headers,
    String? statusMessage,
    required bool isRedirect,
  }) =>
      OfflineResponseBody(
        Stream.fromIterable(
          utf8
              .encode(text)
              .map((elements) => Uint8List.fromList([elements]))
              .toList(),
        ),
        statusCode,
        headers: headers,
        statusMessage: statusMessage,
        isRedirect: isRedirect,
      );
}

class OfflineResponseError extends DioError implements OfflineResponse{

  OfflineResponseError({
    required RequestOptions requestOptions,
    int? statusCode,
    String? errorText,
    DioErrorType type = DioErrorType.other,
    dynamic error,
  }) : super(
          requestOptions: requestOptions,
          response: Response(requestOptions: requestOptions, statusCode: statusCode, data: errorText),
          type: type,
          error: error,
        );


}

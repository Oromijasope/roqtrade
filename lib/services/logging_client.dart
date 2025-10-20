import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoggingClient extends http.BaseClient {
  final http.Client _inner;

  LoggingClient(this._inner) {
    debugPrint("LoggingClient initialized ✅");
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final requestBody = request is http.Request ? request.body : null;

    debugPrint("🟦 HTTP Request → ${request.method} ${request.url}");
    debugPrint("Headers: ${request.headers}");
    if (requestBody != null && requestBody.isNotEmpty) {
      debugPrint("Body: $requestBody");
    }

    final response = await _inner.send(request);

    // Read and log response
    final responseClone = await http.Response.fromStream(response);
    debugPrint("🟩 HTTP Response ← ${response.statusCode} ${request.url}");
    debugPrint("Response Body: ${responseClone.body}");

    // Return original response stream (not consumed)
    return http.StreamedResponse(
      Stream.value(responseClone.bodyBytes),
      responseClone.statusCode,
      headers: responseClone.headers,
      reasonPhrase: responseClone.reasonPhrase,
      request: response.request,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
    );
  }
}

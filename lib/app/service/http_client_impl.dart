import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:flutter_discard_web_app/app/constants/constants.dart';
import 'package:flutter_discard_web_app/app/service/http_client.dart';

class HttpClientImpl implements HttpClient {
  final client = http.Client();

  @override
  Future<Response> get({required String id}) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}$id'),
    );
  }
}

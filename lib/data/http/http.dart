import 'package:http/http.dart' as http;

abstract interface class Http {
  Future<http.Response> get(Uri url);
}

class HttpImpl implements Http {
  @override
  Future<http.Response> get(Uri uri) async {
    return http.get(uri);
  }
}
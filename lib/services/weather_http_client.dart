import 'package:dio/dio.dart';

class WeatherHttpClient {
  final _dio = Dio()
    ..options = BaseOptions(baseUrl: "https://weatherapi-com.p.rapidapi.com/");

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: {
        'X-Rapidapi-Key': '5fc18d78aemshc0dbcff6f70b8eep1af294jsncdbf142c396a',
      }),
    );

    return response.data;
  }
}

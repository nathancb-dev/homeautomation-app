import 'package:http/http.dart';
import '../models/weather_model.dart';
import '../services/weather_http_client.dart';

class WeatherRepository {
  WeatherRepository(this._httpClient);

  final WeatherHttpClient _httpClient;

  Future<List<CityModel>> search(String cityName) async {
    final response = await _httpClient.get(
      '/search.json',
      queryParameters: {'q': cityName},
    );

    return (response as Iterable)
        .map(((e) => CityModel.fromJson(e as Map<String, dynamic>)))
        .toList();
  }
}

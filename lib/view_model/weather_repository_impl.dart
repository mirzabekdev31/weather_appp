import 'package:weather_aapp/view_model/weather_api_client.dart';
import 'package:weather_aapp/model/weather_entity.dart';
import 'package:weather_aapp/model/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final _apiClient = WeatherApi();

  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    final weather = await _apiClient.getWeather(cityName);
    return weather;
  }
}
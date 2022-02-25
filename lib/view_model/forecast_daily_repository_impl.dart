import 'package:weather_aapp/view_model/weather_api_client.dart';
import 'package:weather_aapp/model/forecast_daily_entity.dart';
import 'package:weather_aapp/model/forecast_daily_repository.dart';


class ForecastDailyRepositoryImpl extends ForecastDailyRepository {
  final _apiClient = WeatherApi();

  @override
  Future<ForecastDailyEntity> getForecastDaily(String cityName) async {
    final weather = await _apiClient.getForecastDaily(cityName);
    return weather;
  }
}
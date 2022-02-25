import 'package:weather_aapp/view_model/weather_api_client.dart';

class ImageUrlRepository {
  final _apiClient = WeatherApi();

  String getImg(String icon) => _apiClient.getImgUrl(icon);
}
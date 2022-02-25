import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_aapp/view_model/forecast_daily_repository_impl.dart';
import 'package:weather_aapp/view_model/image_url_repository.dart';
import 'package:weather_aapp/view_model/weather_repository_impl.dart';
import 'package:weather_aapp/model/forecast_daily_entity.dart';
import 'package:weather_aapp/model/weather_entity.dart';


class HomePageModel extends ChangeNotifier {
  final _weatherRepositoryImpl = WeatherRepositoryImpl();
  final _forecastDailyRepositoryImpl = ForecastDailyRepositoryImpl();
  final _imageUrlRepository = ImageUrlRepository();
  final searchController = TextEditingController();
  final now = DateTime.now();

  late WeatherEntity weatherEntity;
  late ForecastDailyEntity forecastDaily;
  List<String> nextDays = [];

  String todayDate = '';
  String _cityName = 'tashkent';

  Future<WeatherEntity> getWeather() async {
    _getTodayDate();
    _getForecastDaily();
    _getNextDays();

    weatherEntity = await _weatherRepositoryImpl.getWeather(_cityName);
    notifyListeners();
    return weatherEntity;
  }

  void searchByCityName() {
    if (searchController.text.isEmpty) return;
    _cityName = searchController.text;
    notifyListeners();

    getWeather();
  }

  String url(String icon) => _imageUrlRepository.getImg(icon);

  void _getTodayDate() {
    final formatDate = DateFormat('MMMM dd, yyyy').format(now);
    todayDate = formatDate;
  }

  void _getNextDays() {
    nextDays.clear();
    var month = DateFormat('MMM').format(now);
    var today = int.parse(DateFormat('dd').format(now));
    for (int i = 1; i < 6; i++) {
      today++;
      nextDays.add('${today.toString()}-$month');
    }
    print(nextDays);
  }

  Future<ForecastDailyEntity> _getForecastDaily() async {
    forecastDaily =
    await _forecastDailyRepositoryImpl.getForecastDaily(_cityName);
    notifyListeners();
    return forecastDaily;
  }
}
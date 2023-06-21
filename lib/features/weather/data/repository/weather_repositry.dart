import '../models/city_weather.dart';

abstract class WeatherRepository {
  Future<CityWeather> getCityWeather({
    required String cityName,
    required int days,
  });
}

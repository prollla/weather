import 'package:dio/dio.dart';
import 'package:weather/features/weather/data/models/city_weather.dart';
import 'package:weather/features/weather/data/repository/weather_repositry.dart';
import 'package:weather/features/weather/data/services/weatherapi.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required Dio dio}) : client = WeatherClient(dio);

  final WeatherClient client;

  @override
  Future<CityWeather> getCityWeather({
    required String cityName,
    required int days,
  }) async {
    return await client.getWeather(cityName, days);
  }
}

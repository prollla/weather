import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather/city_weather.dart';

part 'weatherapi.g.dart';

@RestApi(baseUrl: "https://api.weatherapi.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/v1/forecast.json")
  Future<CityWeather> getWeather(
    @Query("q") String cityName,
    @Query("days") int days,
  );
}

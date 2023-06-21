part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherData extends WeatherState {
  WeatherData({required this.weather});
  final CityWeather weather;
}

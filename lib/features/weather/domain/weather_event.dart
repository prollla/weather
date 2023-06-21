part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class RequestWeatherEvent extends WeatherEvent {
  RequestWeatherEvent({
    required this.city,
    required this.days,
  });

  final String city;
  final int days;
}

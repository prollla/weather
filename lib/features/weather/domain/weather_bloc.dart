import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/city_weather.dart';
import '../data/repository/weather_repositry.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherLoading()) {
    on<RequestWeatherEvent>((event, emit) async {
      emit(WeatherData(
          weather: await repository.getCityWeather(
        cityName: event.city,
        days: event.days,
      )));
    });
  }
}

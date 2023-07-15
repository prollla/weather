import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/weather_bloc.dart';
import 'package:weather/features/weather/view/favorites_screen.dart';
import 'dart:ui';

import 'features/weather/view/wearher_screen.dart';

const apiKey = '6939bd5172fc469face144929230206';
final dio = Dio();

void main() async {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (
      RequestOptions options,
      RequestInterceptorHandler handler,
    ) {
      options.queryParameters['key'] = apiKey;
      handler.next(options);
    },
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (BuildContext context) =>
      WeatherBloc(repository: WeatherRepositoryImpl(dio: dio))
        ..add(RequestWeatherEvent(
          city: 'Воронеж',
          days: 5,
        )),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const WeatherScreen(),
          '/favorites': (context) => const FavoriteScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF29B2DD),
        Color(0xFF2DC8EA),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherData) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 200,
                      // floating: true,
                      pinned: false,
                      flexibleSpace: Stack(
                        children: [
                          Positioned.fill(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Image.asset('assets/Logo.png')),
                                  Text('${state.weather.current?.tempC}°',
                                      style: TextStyle(
                                          fontSize: 60, color: Colors.white)),
                                   Text('${state.weather.current?.condition?.text}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${state.weather.forecast?.forecastday?[0].day?.maxtempC}°',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(width: 10),
                                      Text('${state.weather.forecast?.forecastday?[0].day?.mintempC}°',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10),
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            child: Card(
                              color: const Color(0XFF104084).withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 20),
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Row(
                                      children: [
                                        SizedBox(
                                          height: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          width: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          child:
                                              Image.asset('assets/Rain2.png'),
                                        ),
                                        const Text(
                                          '55%',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        SizedBox(
                                          height: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          width: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          child: Image.asset(
                                              'assets/Градусник.png'),
                                        ),
                                        const Text('90%',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        const Spacer(flex: 1),
                                        SizedBox(
                                          height: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          width: constraints.maxWidth *
                                              0.1, // 10% от ширины экрана
                                          child: Image.asset('assets/Wind.png'),
                                        ),
                                        const Text('19 km/h',
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10),
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            child: Card(
                              color: const Color(0XFF104084).withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10),
                                child: Column(
                                  children: [
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('Today',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(
                                          width: 160,
                                        ),
                                        Expanded(
                                            child: Center(
                                                child: Text('June 14',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Остальные строки с четырьмя элементами в каждой
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.current?.tempC ?? '0'}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('00:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('01:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('02:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('03:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10),
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            child: Card(
                              color: const Color(0XFF104084).withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10),
                                child: Column(
                                  children: [
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('Today',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        SizedBox(
                                          width: 160,
                                        ),
                                        Expanded(
                                            child: Center(
                                                child: Text('June 14',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Остальные строки с четырьмя элементами в каждой
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('29°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.45,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.asset('assets/Logo.png'),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('00:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('01:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('02:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('03:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}

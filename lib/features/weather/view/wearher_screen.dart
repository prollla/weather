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
                                          child: Transform.scale(
                                            scale: 2,
                                              child: Image.network('https:${state.weather.current?.condition?.icon}'))),
                                  Text('${state.weather.location?.name}°',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white)),
                                  Text('${state.weather.current?.tempC}°',
                                      style: TextStyle(
                                          fontSize: 50, color: Colors.white)),
                                   Text('${state.weather.current?.condition?.text}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Max: ${state.weather.forecast?.forecastday?[0].day?.maxtempC}°',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(width: 10),
                                      Text('Min: ${state.weather.forecast?.forecastday?[0].day?.mintempC}°',
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
                                         Text(
                                          '${state.weather.forecast!.forecastday?[0].day?.dailyChanceOfRain}%',
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
                                        Text('${state.weather.current?.humidity}%',
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
                                         Text('${state.weather.current?.windMph} м/с',
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
                                    const Row(
                                      children: [
                                        Expanded(child: Center(
                                          child: Text('Погода по дням', style: TextStyle(
                                            color: Colors.white
                                          ),),
                                        ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                    child: Text('Сегодня',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('Завтра',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('Послезавтра',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].day?.avgtempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[1].day?.avgtempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[2].day?.avgtempC}°',
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
                                          widthFactor: 0.55,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.network('https:${state.weather.current?.condition?.icon}'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.55,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.network('https:${state.weather.current?.condition?.icon}'),
                                        )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                          widthFactor: 0.55,
                                          // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                          child: Image.network('https:${state.weather.current?.condition?.icon}'),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                     Row(
                                      children: [
                                        SizedBox(width: 25,),
                                        Expanded(
                                            child: Center(
                                                child:
                                                Row(
                                                  children: [
                                                    Image.asset('assets/Rain2.png'),
                                                    Text('${state.weather.forecast!.forecastday?[0].day?.dailyChanceOfRain}%',
                                                    style: TextStyle(
                                                      color: Colors.white
                                                    )),
                                                  ],
                                                ))),
                                        SizedBox(width: 25,),
                                        Expanded(
                                            child: Center(

                                                child:
                                                Row(
                                                  children: [
                                                    Image.asset('assets/Rain2.png'),
                                                    Text('${state.weather.forecast!.forecastday?[0].day?.dailyChanceOfRain}%',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        )),
                                                  ],
                                                ))),
                                        SizedBox(width: 25,),
                                        Expanded(

                                            child: Center(

                                                child:
                                                Row(
                                                  children: [
                                                    Image.asset('assets/Rain2.png'),
                                                    Text('${state.weather.forecast!.forecastday?[0].day?.dailyChanceOfRain}%',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        )),
                                                  ],
                                                ))),
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
                                    const Row(
                                      children: [
                                        Expanded(child: Center(
                                          child: Text('Почасовая погода на сегодня', style: TextStyle(
                                              color: Colors.white
                                          ),),
                                        ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
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
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Остальные строки с четырьмя элементами в каждой
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[0].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[1].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[2].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[3].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[0].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[0].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[0].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[0].condition?.icon}'),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('04:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('05:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('06:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('07:00',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[4].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[5].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[6].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[7].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[4].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[5].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[6].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[7].condition?.icon}'),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),

                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('08:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('09:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('10:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('11:00',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[8].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[9].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[10].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[11].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[8].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[9].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[10].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[11].condition?.icon}'),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('12:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('13:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('14:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('15:00',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[12].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[13].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[14].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[15].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[12].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[13].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[14].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[15].condition?.icon}'),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('16:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('17:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('18:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('19:00',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[16].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[17].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[18].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[19].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[16].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[17].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[18].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[19].condition?.icon}'),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Верхняя строка с двумя элементами
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Center(
                                                child: Text('20:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('21:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),

                                        Expanded(
                                            child: Center(
                                                child: Text('22:00',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('23:00',
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
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[20].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[21].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[22].tempC}°',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Expanded(
                                            child: Center(
                                                child: Text('${state.weather.forecast!.forecastday?[0].hour?[23].tempC}°',
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
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[20].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[21].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[22].condition?.icon}'),
                                            )),
                                        Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.55,
                                              // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                              child: Image.network('https:${state.weather.forecast!.forecastday?[0].hour?[23].condition?.icon}'),
                                            )),
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

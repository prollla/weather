import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/weather_bloc.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

TextStyle whiteText = const TextStyle(
  fontSize: 18,
  color: Colors.white,
);

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherData) {
          return WeatherBackground(
            state: state,
            child: WeatherBody(state: state),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class WeatherBackground extends StatelessWidget {
  final WeatherData state;
  final Widget child;

  const WeatherBackground(
      {super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      const Color(0xFF29B2DD),
      const Color(0xFF33AADD),
      const Color(0xFF2DC8EA),
    ];

    DateTime currentTime = DateTime.parse(state.weather.current!.lastUpdated!);
    int currentHour = currentTime.hour;
    gradientColors = (currentHour >= 22 || currentHour <= 6)
        ? [
            const Color(0xFF08244F),
            const Color(0xFF023553),
            const Color(0xFF001026),
          ]
        : gradientColors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

class WeatherBody extends StatelessWidget {
  final WeatherData state;

  const WeatherBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          WeatherAppBar(state: state),
          WeatherDetails(state: state),
        ],
      ),
      endDrawer: MyDrawer(state: state),
    );
  }
}

class WeatherAppBar extends StatelessWidget {
  final WeatherData state;

  const WeatherAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: WeatherHeader(state: state),
          );
        },
      ),
    );
  }
}

class WeatherHeader extends StatelessWidget {
  final WeatherData state;

  const WeatherHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 2,
            child: Image.asset(
              'assets/Logo.png',
              height: 170,
              width: 170,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${state.weather.current?.tempC}°',
            style: const TextStyle(fontSize: 50, color: Colors.white),
          ),
          Text(
            '${state.weather.current?.condition?.text}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Max: ${state.weather.forecast?.forecastday?[0].day?.maxtempC}°',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                'Min: ${state.weather.forecast?.forecastday?[0].day?.mintempC}°',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final WeatherData state;

  const WeatherDetails({required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        WeatherInfoBar(),
        TodayWeatherSection(state: state),
        NextForecastSection(),
      ]),
    );
  }
}

class WeatherInfoBar extends StatelessWidget {
  const WeatherInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 47,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF1044084).withOpacity(0.7),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Image.asset('assets/Rain2.png'),
                  Text(
                    "18%",
                    style: whiteText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                children: [
                  Image.asset('assets/Градусник.png'),
                  Text(
                    "67%",
                    style: whiteText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset('assets/Wind.png'),
                  ),
                  Text(
                    "25 mp/h",
                    style: whiteText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodayWeatherSection extends StatelessWidget {
  final WeatherData state;

  const TodayWeatherSection({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      child: Container(
        height: 303,
        width: 217,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF104084).withOpacity(0.7),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 206),
                  Text("June", style: whiteText),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
                  child: Text(
                    "${state.weather.current?.tempC}°",
                    style: whiteText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Text(
                    "${state.weather.current?.tempC}°",
                    style: whiteText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Text(
                    "${state.weather.current?.tempC}°",
                    style: whiteText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    "${state.weather.current?.tempC}°",
                    style: whiteText,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  child: SizedBox(
                    height: 21,
                    width: 21,
                    child: Transform.scale(
                      scale: 4,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  child: SizedBox(
                    height: 21,
                    width: 21,
                    child: Transform.scale(
                      scale: 4,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  child: SizedBox(
                    height: 21,
                    width: 21,
                    child: Transform.scale(
                      scale: 4,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  child: SizedBox(
                    height: 21,
                    width: 21,
                    child: Transform.scale(
                      scale: 4,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text('15:00', style: whiteText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("16:00", style: whiteText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("17:00", style: whiteText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("18:00", style: whiteText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextForecastSection extends StatelessWidget {
  const NextForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 230,
        width: 217,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF104084).withOpacity(0.7),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 11, 165, 0),
              child: Text(
                "Next Forecast",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 19, 0, 14),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: whiteText,
                  ),
                  Transform.scale(
                    scale: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                      child: Image.asset(
                        "assets/Logo.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: Text(
                      "13°",
                      style: whiteText,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 19, 0, 14),
              child: Row(
                children: [
                  Text(
                    "Tomorrow",
                    style: whiteText,
                  ),
                  Transform.scale(
                    scale: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Image.asset(
                        "assets/Logo.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(102, 0, 0, 0),
                    child: Text(
                      "13°",
                      style: whiteText,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 19, 0, 14),
              child: Row(
                children: [
                  Text(
                    "After tomorrow",
                    style: whiteText,
                  ),
                  Transform.scale(
                    scale: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Image.asset(
                        "assets/Logo.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: Text(
                      "13°",
                      style: whiteText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final WeatherData state;
  const MyDrawer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${state.weather.location?.country}',
                  style: whiteText,
                ),
                Text(
                  '${state.weather.location?.name}',
                  style: whiteText
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Погода'),
            onTap: () {
              // Обработчик нажатия на пункт меню "Главная"
              Navigator.pushReplacementNamed(context, '/'); // Закрыть боковое меню после выбора
              // Дополнительные действия при выборе пункта меню "Главная"
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Избранные города'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}

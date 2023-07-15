import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/view/wearher_screen.dart';

import '../domain/weather_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List favoritesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Избранные места"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (BuildContext context, int index) {
          // Ваш код для построения элементов списка
          return Container();
        },
      ),
    );
  }
}


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
                  '123',
                  style: whiteText,
                ),
                Text(
                    '123',
                    style: whiteText
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Погода'),
            onTap: () {
              WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
              weatherBloc.add(RequestWeatherEvent(city: 'Лондон', days: 3)); // Передача новых данных через событие
              Navigator.pushReplacementNamed(context, '/'); // Открытие WeatherScreen
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

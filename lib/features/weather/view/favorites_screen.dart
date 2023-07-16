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
  late String _city;
  List favoritesList = [];

  @override
  void initState() {
    super.initState();
    favoritesList.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранные места"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(favoritesList[index]),
            child: Card(
              child: ListTile(
                title: Text(favoritesList[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.cloud,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        WeatherBloc weatherBloc =
                            BlocProvider.of<WeatherBloc>(context);
                        weatherBloc.add(RequestWeatherEvent(
                            city: favoritesList[index], days: 3));
                        Navigator.pushReplacementNamed(context, '/');
                        // Handle delete button pressed
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          favoritesList.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                favoritesList.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
          onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text("Введите город"),
              content: TextField(
                onChanged: (String value){
                  _city = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    favoritesList.add(_city);
                  });
                  Navigator.of(context).pop();
                }, child: const Text("Добавить"),)
              ],
            );
          });
          }, child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}

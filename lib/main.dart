import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weather/weatherapi.dart';

final apiKey = '6939bd5172fc469face144929230206';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          // floating: true,
          pinned: false,
          flexibleSpace: Container(
            height: 200,
          ),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 99, (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Card(
                    child: ListTile(
                      title:
                          Text('Карточка $index', textAlign: TextAlign.center),
                      subtitle: Text(
                        'Описание карточки $index',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        }))
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final client = RestClient(dio);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        options.queryParameters['key'] = apiKey;
        handler.next(options);
      },
    ));
    client.getWeather('London', 5).then(
        (weather) => print(weather.current?.tempC),
        onError: (e) => print(e.toString()));
  }
}

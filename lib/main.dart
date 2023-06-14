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
      home: const MyHomePage(title: 'Flutter Demo Home Page',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class A {
  A({required this.id, this.name,});
  final int id;
  final String? name;
}

class _MyHomePageState extends State<MyHomePage> {
  List<A> items = [
    A(id: 123, name: 'test1'),
    A(id: 321, name: 'test2'),
  ];

  @override
  Widget build(BuildContext context) {
    double borderRadius = MediaQuery.of(context).size.width * 0.12;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          // floating: true,
          pinned: false,flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset('assets/Облачно.png')),
                    Text('Облачно'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Max: 29°'),
                        SizedBox(width: 10),
                        Text('Min: 15°'),
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
          delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Row(
                          children: [
                            SizedBox(
                              height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              child: Image.asset('assets/Влажность.png'),
                            ),
                            Text('123'),
                            Spacer(flex: 1,),
                            SizedBox(
                              height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              child: Image.asset('assets/Градусник.png'),
                            ),
                            Text('90%'),
                            Spacer(flex:1),
                            SizedBox(
                              height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                              child: Image.asset('assets/Ветер.png'),
                            ),
                            Text('19 km/h')
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Column(
                      children: [
                        // Верхняя строка с двумя элементами
                        Row(
                          children: [
                            Expanded(child: Center(child: Text('Today'))),
                            Expanded(child: Center(child: Text('June 14'))),
                          ],
                        ),

                        // Остальные строки с четырьмя элементами в каждой
                        Row(
                          children: [
                            Expanded(child: Center(child: Text('29°'))),
                            Expanded(child: Center(child: Text('29°'))),
                            Expanded(child: Center(child: Text('29°'))),
                            Expanded(child: Center(child: Text('29°'))),
                          ],
                        ),
                        Row(
                          children: [
                        Expanded(child: FractionallySizedBox(
                        widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                          child: Image.asset('assets/Облачно.png'),
                        )),
                            Expanded(child: FractionallySizedBox(
                              widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                              child: Image.asset('assets/Облачно.png'),
                            )),
                            Expanded(child: FractionallySizedBox(
                              widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                              child: Image.asset('assets/Облачно.png'),
                            )),
                            Expanded(child: FractionallySizedBox(
                              widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                              child: Image.asset('assets/Облачно.png'),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Center(child: Text('00:00'))),
                            Expanded(child: Center(child: Text('01:00'))),
                            Expanded(child: Center(child: Text('02:00'))),
                            Expanded(child: Center(child: Text('03:00 '))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3, // 30% от высоты экрана
                      width: MediaQuery.of(context).size.width * 0.7, // 80% от ширины экрана
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3, // 30% от высоты экрана
                      width: MediaQuery.of(context).size.width * 0.7, // 80% от ширины экрана
                    ),
                  ),
                ),
              ]
          ),
        )
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

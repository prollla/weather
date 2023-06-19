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
        //primarySwatch: Colors.blue,


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


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF29B2DD),
          Color(0xFF2DC8EA),
        ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 200,
            // floating: true,
            pinned: false,flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset('assets/Logo.png')),
                      Text('29°',
                          style: TextStyle(fontSize: 60, color: Colors.white)),
                      Text('Облачно',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Max: 29°',
                            style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Text('Min: 15°',
                            style: TextStyle(color: Colors.white)),
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
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: Card(
                        color: Color(0XFF104084).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              return Row(
                                children: [
                                  SizedBox(
                                    height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    child: Image.asset('assets/Rain2.png'),
                                  ),
                                  Text('55%', style: TextStyle(color: Colors.white),),
                                  Spacer(flex: 1,),
                                  SizedBox(
                                    height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    child: Image.asset('assets/Градусник.png'),
                                  ),
                                  Text('90%',
                                      style: TextStyle(color: Colors.white)),
                                  Spacer(flex:1),
                                  SizedBox(
                                    height: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    width: constraints.maxWidth * 0.1, // 10% от ширины экрана
                                    child: Image.asset('assets/Wind.png'),
                                  ),
                                  Text('19 km/h',
                                      style: TextStyle(color: Colors.white))
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: Card(
                          color: Color(0XFF104084).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                            child: Column(
                              children: [
                                // Верхняя строка с двумя элементами
                                Row(
                                  children: [
                                    Expanded(child: Center(child: Text('Today',
                                        style: TextStyle(color: Colors.white)))),
                                    SizedBox(width: 160,),
                                    Expanded(child: Center(child: Text('June 14',
                                        style: TextStyle(color: Colors.white)))),
                                  ],
                                ),
                                SizedBox(height: 25,),
                                // Остальные строки с четырьмя элементами в каждой
                                Row(
                                  children: [
                                    Expanded(child: Center(child: Text('29°',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('29°',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('29°',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('29°',
                                        style: TextStyle(color: Colors.white)))),
                                  ],
                                ),
                                SizedBox(height: 25,),
                                Row(
                                  children: [
                                Expanded(child: FractionallySizedBox(
                                widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                  child: Image.asset('assets/Logo.png'),
                                )),
                                    Expanded(child: FractionallySizedBox(
                                      widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                      child: Image.asset('assets/Logo.png'),
                                    )),
                                    Expanded(child: FractionallySizedBox(
                                      widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                      child: Image.asset('assets/Logo.png'),
                                    )),
                                    Expanded(child: FractionallySizedBox(
                                      widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                      child: Image.asset('assets/Logo.png'),
                                    )),
                                  ],
                                ),
                                SizedBox(height: 25,),
                                Row(
                                  children: [
                                    Expanded(child: Center(child: Text('00:00',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('01:00',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('02:00',
                                        style: TextStyle(color: Colors.white)))),
                                    Expanded(child: Center(child: Text('03:00',
                                        style: TextStyle(color: Colors.white)))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: Card(
                        color: Color(0XFF104084).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                          child: Column(
                            children: [
                              // Верхняя строка с двумя элементами
                              Row(
                                children: [
                                  Expanded(child: Center(child: Text('Today',
                                      style: TextStyle(color: Colors.white)))),
                                  SizedBox(width: 160,),
                                  Expanded(child: Center(child: Text('June 14',
                                      style: TextStyle(color: Colors.white)))),
                                ],
                              ),
                              SizedBox(height: 25,),
                              // Остальные строки с четырьмя элементами в каждой
                              Row(
                                children: [
                                  Expanded(child: Center(child: Text('29°',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('29°',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('29°',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('29°',
                                      style: TextStyle(color: Colors.white)))),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Row(
                                children: [
                                  Expanded(child: FractionallySizedBox(
                                    widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                    child: Image.asset('assets/Logo.png'),
                                  )),
                                  Expanded(child: FractionallySizedBox(
                                    widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                    child: Image.asset('assets/Logo.png'),
                                  )),
                                  Expanded(child: FractionallySizedBox(
                                    widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                    child: Image.asset('assets/Logo.png'),
                                  )),
                                  Expanded(child: FractionallySizedBox(
                                    widthFactor: 0.45,  // Устанавливаем ширину изображения в 50% от ширины родительского контейнера
                                    child: Image.asset('assets/Logo.png'),
                                  )),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Row(
                                children: [
                                  Expanded(child: Center(child: Text('00:00',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('01:00',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('02:00',
                                      style: TextStyle(color: Colors.white)))),
                                  Expanded(child: Center(child: Text('03:00',
                                      style: TextStyle(color: Colors.white)))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          )
        ],
      )),
    );
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

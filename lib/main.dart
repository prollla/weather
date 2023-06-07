import 'package:flutter/material.dart';

void main() {
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
                          title: Text('Карточка $index',
                              textAlign: TextAlign.center),
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
}

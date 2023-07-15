import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("123"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoritesList.length,
          itemBuilder: (BuildContext context, int index){

          }),
    );
  }
}

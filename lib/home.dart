import 'package:flutter/material.dart';

import 'city_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Lyon', 'image': 'assets/images/lyon.webp'},
    {'name': 'Paris', 'image': 'assets/images/paris.webp'},
    {'name': 'Nice', 'image': 'assets/images/nice.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("City trip"),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return CityCard(
                  name: city['name'],
                  image: city['image'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

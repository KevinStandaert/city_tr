import 'package:flutter/material.dart';

import '../../models/city_model.dart';
import '../../widgets/city_trip_drawer.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
  List cities = [
    City(name: 'Paris', image: 'assets/images/paris.webp'),
    City(name: 'Lyon', image: 'assets/images/lyon.webp'),
    City(name: 'Nice', image: 'assets/images/nice.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City trip"),
      ),
      drawer: CityTripDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...cities.map(
                (city) {
                  return CityCard(
                    city: city,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

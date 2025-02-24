import 'package:flutter/material.dart';

import '../../models/city_model.dart';
import '../../widgets/city_trip_drawer.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  final List<City> cities;
  const HomeView({super.key, required this.cities});

  @override
  State<HomeView> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
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
              ...widget.cities.map(
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

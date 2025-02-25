import 'package:city_tr/models/city_model.dart';
import 'package:city_tr/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/city_trip_drawer.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
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
            children: cities.map(
              (city) {
                return CityCard(
                  city: city,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

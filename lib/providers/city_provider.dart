import 'dart:collection';

import 'package:city_tr/data/data.dart' as data;
import 'package:city_tr/models/city_model.dart';
import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);
}

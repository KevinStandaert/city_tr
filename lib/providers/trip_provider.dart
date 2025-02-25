import 'dart:collection';

import 'package:city_tr/data/data.dart' as data;
import 'package:city_tr/models/trip_model.dart';
import 'package:flutter/widgets.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);
}

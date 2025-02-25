import 'dart:collection';

import 'package:city_tr/data/data.dart' as data;
import 'package:city_tr/models/activity_model.dart';
import 'package:city_tr/models/trip_model.dart';
import 'package:flutter/widgets.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  Trip getTripById(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}

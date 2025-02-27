import 'package:city_tr/models/activity_model.dart';
import 'package:flutter/material.dart';

class Trip {
  String city;
  String id;
  List<Activity> activities;
  DateTime? date;

  Trip({required this.city, required this.activities, this.date})
      : id = UniqueKey().toString();
}

import 'package:city_tr/models/activity_model.dart';

class Trip {
  String city;
  List<Activity> activities;
  DateTime? date;

  Trip({required this.city, required this.activities, this.date});
}

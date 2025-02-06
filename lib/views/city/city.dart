import 'package:city_tr/models/activity.model.dart';
import 'package:city_tr/models/trip.model.dart';
import 'package:city_tr/views/city/widgets/activity_card.dart';
import 'package:city_tr/views/city/widgets/trip_overview.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Organisation de votre voyage'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(setDate: setDate, myTrip: myTrip),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: widget.activities
                      .map((activity) => ActivityCard(activity: activity))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

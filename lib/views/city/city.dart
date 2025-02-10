import 'package:city_tr/models/activity.model.dart';
import 'package:city_tr/models/trip.model.dart';

import 'package:city_tr/views/city/widgets/activity_list.dart';
import 'package:city_tr/views/city/widgets/trip_activity_list.dart';
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
  late Trip myTrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], city: 'Paris', date: null);
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
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
      body: Column(
        children: [
          TripOverview(
            setDate: setDate,
            myTrip: myTrip,
          ),
          Expanded(
            child: index == 0
                ? ActivityList(
                    activities: widget.activities,
                    selectedActivites: myTrip.activities,
                    toggleActivity: toggleActivity,
                  )
                : TripActivityList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Découverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Mes activités',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}

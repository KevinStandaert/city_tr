import 'package:city_tr/models/activity.model.dart';
import 'package:city_tr/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Paris'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: widget.activities.map((activity) {
            return ActivityCard(activity: activity);
          }).toList(),
        ),
      ),
    );
  }
}

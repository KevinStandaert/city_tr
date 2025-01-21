import 'package:city_tr/models/activity.model.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart' as data;


class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  final List<Activity> activities = data.activities;

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
          children: [],
        ),
      ),
    );
  }
}

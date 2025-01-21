import 'package:city_tr/models/activity.model.dart';
import 'package:city_tr/models/trip.model.dart';
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
  Trip mytrip = Trip(activities: [], city: 'Paris', date: DateTime.now());

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
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                height: 300,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Choisissez une date'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Selectionner une date'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text('Choisissez une ville'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Selectionner une ville'),
                        ),
                      ],
                    )
                  ],
                )),
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

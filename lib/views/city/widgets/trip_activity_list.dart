import 'package:city_tr/models/activity.model.dart';
import 'package:city_tr/views/city/widgets/trip_activity_card.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList(
      {super.key, required this.activities, required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: activities
          .map(
            (activity) => TripActivityCard(
              key: ValueKey(activity.id),
              activity: activity,
              deleteTripActivity: deleteTripActivity,
            ),
          )
          .toList(),
    );
  }
}

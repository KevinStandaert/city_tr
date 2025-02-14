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
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return TripActivityCard(
            activity: activity, deleteTripActivity: deleteTripActivity);
      },
      itemCount: activities.length,
    );
  }
}

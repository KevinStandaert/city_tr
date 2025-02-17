import 'package:city_tr/models/activity_model.dart';
import 'package:city_tr/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<String> selectedActivites;
  final Function toggleActivity;

  const ActivityList(
      {super.key,
      required this.activities,
      required this.selectedActivites,
      required this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: activities
            .map(
              (activity) => ActivityCard(
                activity: activity,
                isSelected: selectedActivites.contains(activity.id),
                toggleActivity: () {
                  toggleActivity(activity.id);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

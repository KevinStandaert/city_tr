import 'package:city_tr/models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  const TripActivityList({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, i) {
          Activity activity = activities[i];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              key: ValueKey(activity.id),
              child: Card(
                child: ListTile(
                  title: Text(activity.name),
                ),
              ),
              onDismissed: (_) {
                print('Dismissed');
              },
            ),
          );
        });
  }
}

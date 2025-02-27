import 'package:city_tr/models/activity_model.dart';
import 'package:city_tr/providers/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final ActivityStatus filter;

  const TripActivityList(
      {super.key, required this.activities, required this.filter});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, i) {
          Activity activity = activities[i];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: filter == ActivityStatus.ongoing
                ? Dismissible(
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
                      Provider.of<TripProvider>(context, listen: false)
                          .setActivityToDone(activity);
                    },
                  )
                : Card(
                    child: ListTile(
                      title: Text(activity.name,
                          style: TextStyle(color: Colors.blueGrey)),
                    ),
                  ),
          );
        });
  }
}

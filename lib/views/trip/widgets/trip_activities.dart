import 'package:city_tr/models/activity_model.dart';
import 'package:city_tr/views/trip/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  const TripActivities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.orange,
            child: const TabBar(
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.all(5),
              labelColor: Colors.white,
              tabs: [
                Tab(text: 'En cours'),
                Tab(text: 'Terminé'),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TripActivityList(activities: activities),
                TripActivityList(activities: activities),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

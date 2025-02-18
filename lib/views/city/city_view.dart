import 'package:city_tr/models/activity_model.dart';
import 'package:city_tr/models/trip_model.dart';
import 'package:city_tr/views/home/home_view.dart';
import '../../models/city_model.dart';
import '../../widgets/data.dart';

import 'package:city_tr/views/city/widgets/activity_list.dart';
import 'package:city_tr/views/city/widgets/trip_activity_list.dart';
import 'package:city_tr/views/city/widgets/trip_overview.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart' as data;

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final List<Activity> activities = data.activities;

  CityView({
    super.key,
  });

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: children);
    } else {
      return Column(children: children);
    }
  }

  @override
  State<CityView> createState() => _CityState();
}

class _CityState extends State<CityView> {
  late Trip myTrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], city: 'Paris', date: null);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      var activity =
          widget.activities.firstWhere((activity) => activity.id == element);
      return activity.price + prev;
    });
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

  void deleteTripActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Voulez vous sauvegarder?',
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    'Sauvegarder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
    print(result);
    if (mounted) Navigator.pushNamed(context, HomeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context)!.settings.arguments as City;

    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation de votre voyage'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: widget.showContext(
        context: context,
        children: [
          TripOverview(
            cityName: city.name,
            setDate: setDate,
            myTrip: myTrip,
            amount: amount,
          ),
          Expanded(
            child: index == 0
                ? ActivityList(
                    activities: widget.activities,
                    selectedActivites: myTrip.activities,
                    toggleActivity: toggleActivity,
                  )
                : TripActivityList(
                    activities: tripActivities,
                    deleteTripActivity: deleteTripActivity,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: Icon(Icons.card_travel),
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

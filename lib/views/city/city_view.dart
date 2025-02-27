import 'package:city_tr/providers/city_provider.dart';
import 'package:city_tr/providers/trip_provider.dart';
import 'package:provider/provider.dart';

import '../../models/activity_model.dart';
import '../../models/trip_model.dart';
import '../home/home_view.dart';
import '../../widgets/city_trip_drawer.dart';
import '../../models/city_model.dart';
import '../../widgets/data.dart';

import 'widgets/activity_list.dart';
import 'widgets/trip_activity_list.dart';
import 'widgets/trip_overview.dart';
import 'package:flutter/material.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

  const CityView({
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
    myTrip = Trip(
      activities: [],
      city: '',
      date: null,
    );
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      return element.price + prev;
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

  void toggleActivity(Activity activity) {
    setState(() {
      myTrip.activities.contains(activity)
          ? myTrip.activities.remove(activity)
          : myTrip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      myTrip.activities.remove(activity);
    });
  }

  void saveTrip(String cityName) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Voulez vous sauvegarder?',
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.all(20),
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
                  child: const Text(
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

    if (myTrip.date == null) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Attention !'),
              content: const Text('Vous n\'avez pas encore choisi de date'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('0k'),
                )
              ],
            );
          },
        );
      }
    } else if (result == 'save') {
      myTrip.city = cityName;

      if (mounted) {
        Provider.of<TripProvider>(context, listen: false).addTrip(myTrip);
        Navigator.pushNamed(context, HomeView.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;

    City city = Provider.of<CityProvider>(context).getCityByName(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation de votre voyage'),
      ),
      drawer: CityTripDrawer(),
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
                    activities: city.activities,
                    selectedActivites: myTrip.activities,
                    toggleActivity: toggleActivity,
                  )
                : TripActivityList(
                    activities: myTrip.activities,
                    deleteTripActivity: deleteTripActivity,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveTrip(cityName);
        },
        child: const Icon(Icons.card_travel),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Découverte',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Mes activités',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../views/trips/trips_view.dart';
import '../views/home/home_view.dart';

class CityTripDrawer extends StatelessWidget {
  const CityTripDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withValues(alpha: 0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Text(
            'City trip',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Accueil'),
          onTap: () {
            Navigator.pushNamed(context, HomeView.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        ListTile(
          leading: const Icon(Icons.flight),
          title: const Text('Mes voyages'),
          onTap: () {
            Navigator.pushNamed(context, TripsView.routeName);
          },
        ),
      ]),
    );
  }
}

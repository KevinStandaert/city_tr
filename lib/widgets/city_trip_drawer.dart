import 'package:flutter/material.dart';

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
          child: Text(
            'City trip',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Accueil'),
          onTap: () {
            Navigator.pushNamed(context, HomeView.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        ListTile(
          leading: Icon(Icons.flight),
          title: Text('Mes voyages'),
          onTap: () {},
        ),
      ]),
    );
  }
}

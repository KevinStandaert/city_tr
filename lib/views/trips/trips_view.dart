import 'package:city_tr/providers/trip_provider.dart';
import 'package:city_tr/views/trips/widgets/trip_list.dart';
import 'package:provider/provider.dart';

import '../../models/trip_model.dart';

import '../../widgets/city_trip_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatelessWidget {
  static const String routeName = '/trips';

  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mes voyages'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.all(5),
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'A venir',
              ),
              Tab(
                text: 'Passés',
              ),
            ],
          ),
        ),
        drawer: const CityTripDrawer(),
        body: TabBarView(
          children: [
            TripList(
              trips: trips
                  .where((trip) => DateTime.now().isBefore(trip.date!))
                  .toList(),
            ),
            TripList(
              trips: trips
                  .where((trip) => DateTime.now().isAfter(trip.date!))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

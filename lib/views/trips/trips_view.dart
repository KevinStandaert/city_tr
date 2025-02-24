import 'package:city_tr/views/trips/widgets/trip_list.dart';

import '../../models/trip_model.dart';

import '../../widgets/city_trip_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';
  final List<Trip> trips;

  const TripsView({super.key, required this.trips});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mes voyages'),
          bottom: TabBar(
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
        drawer: CityTripDrawer(),
        body: TabBarView(
          children: [
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isBefore(trip.date!))
                  .toList(),
            ),
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isAfter(trip.date!))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

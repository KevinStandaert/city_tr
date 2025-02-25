import 'package:city_tr/models/trip_model.dart';
import 'package:city_tr/providers/city_provider.dart';
import 'package:city_tr/providers/trip_provider.dart';
import 'package:city_tr/views/trip/widgets/trip_activities.dart';
import 'package:city_tr/views/trip/widgets/trip_city_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/city_model.dart';

class TripView extends StatelessWidget {
  static const String routeName = '/trip';
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['cityName']!;
    final String tripId = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['tripId']!;
    final City city =
        Provider.of<CityProvider>(context).getCityByName(cityName);
    final Trip trip = Provider.of<TripProvider>(context).getTripById(tripId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripCityBar(
              city: city,
            ),
            TripActivities(activities: trip.activities),
          ],
        ),
      ),
    );
  }
}

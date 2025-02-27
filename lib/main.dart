import 'package:city_tr/providers/city_provider.dart';
import 'package:city_tr/providers/trip_provider.dart';
import 'package:city_tr/views/trip/trip_view.dart';
import 'package:city_tr/views/trips/trips_view.dart';

import 'package:provider/provider.dart';

import 'views/404/not_found.dart';

import 'package:flutter/material.dart';

import 'views/city/city_view.dart';
import 'widgets/data.dart';

import './views/home/home_view.dart';

main() {
  runApp(Data(
    child: CityTrip(),
  ));
}

class CityTrip extends StatefulWidget {
  const CityTrip({super.key});
  // final List<City> cities = data.cities;

  @override
  State<CityTrip> createState() => _CityTripState();
}

class _CityTripState extends State<CityTrip> {
  // List<Trip> trips = [];

  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CityProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TripProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            titleTextStyle: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          textTheme: TextTheme(titleMedium: TextStyle(color: Colors.green)),
          primaryColor: Colors.green,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.green, secondary: Colors.orange),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.orange),
              foregroundColor: WidgetStateProperty.all(Colors.black),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.routeName: (context) => HomeView(),
          CityView.routeName: (context) => CityView(),
          TripsView.routeName: (context) => TripsView(),
          TripView.routeName: (context) => TripView(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => NotFound(),
        ),
      ),
    );
  }
}

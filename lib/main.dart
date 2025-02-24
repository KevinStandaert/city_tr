import 'package:city_tr/views/trip/trip_view.dart';

import 'data/data.dart' as data;
import 'models/trip_model.dart';
import 'views/404/not_found.dart';
import 'views/trips/trips_view.dart';
import 'package:flutter/material.dart';

import 'models/city_model.dart';
import 'views/city/city_view.dart';
import 'widgets/data.dart';

import './views/home/home_view.dart';

main() {
  runApp(Data(
    child: CityTrip(),
  ));
}

class CityTrip extends StatefulWidget {
  CityTrip({super.key});
  final List<City> cities = data.cities;

  @override
  State<CityTrip> createState() => _CityTripState();
}

class _CityTripState extends State<CityTrip> {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        HomeView.routeName: (context) => HomeView(cities: widget.cities),
      },

      // ignore: body_might_complete_normally_nullable
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  final City city = settings.arguments as City;
                  return CityView(
                    city: city,
                    addTrip: addTrip,
                  );
                },
              );
            }
          case TripsView.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  return TripsView(trips: trips);
                },
              );
            }
          case TripView.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  String tripId =
                      (settings.arguments as Map<String, String>)['tripId']!;
                  String cityName =
                      (settings.arguments as Map<String, String>)['cityName']!;

                  return TripView(
                    trip: trips.firstWhere((trip) => trip.id == tripId),
                    city: widget.cities
                        .firstWhere((city) => city.name == cityName),
                  );
                },
              );
            }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return NotFound();
          },
        );
      },
    );
  }
}

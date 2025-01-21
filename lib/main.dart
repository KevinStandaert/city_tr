import 'package:city_tr/views/city/city.dart';
import 'package:flutter/material.dart';

// import 'views/home/home.dart';

main() {
  runApp(CityTrip());
}

class CityTrip extends StatelessWidget {
  const CityTrip({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: City(),
    );
  }
}

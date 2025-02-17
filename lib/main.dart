import 'package:city_tr/views/404/not_found.dart';
import 'package:flutter/material.dart';

import 'views/city/city_view.dart';
import 'widgets/data.dart';

import './views/home/home_view.dart';

main() {
  runApp(Data(
    child: CityTrip(),
  ));
}

class CityTrip extends StatelessWidget {
  const CityTrip({super.key});

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
        '/': (context) => HomeView(),
        '/city': (context) => CityView(),
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

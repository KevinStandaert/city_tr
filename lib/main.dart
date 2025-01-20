import 'package:flutter/material.dart';

main() {
  runApp(CityTrip());
}

class CityTrip extends StatelessWidget {
  const CityTrip({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("City trip"),
          actions: const <Widget>[Icon(Icons.more_vert)],
        ),
        body: const Text("City trip"),
      ),
    );
  }
}

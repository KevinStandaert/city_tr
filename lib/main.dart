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
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('assets/images/paris.webp', fit: BoxFit.cover)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

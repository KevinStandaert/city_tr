import 'package:flutter/material.dart';

import '../../../models/city_model.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/city',
                    arguments: city.name,
                  );
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  city.name,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

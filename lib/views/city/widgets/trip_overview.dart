import 'package:city_tr/models/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip;
  final String cityName;
  final double amount;

  const TripOverview({
    super.key,
    required this.setDate,
    required this.myTrip,
    required this.cityName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width:
          orientation == Orientation.landscape ? size.width * 0.5 : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  myTrip.date != null
                      ? DateFormat("dd/MM/y").format(myTrip.date!)
                      : 'Choisissez une date',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text('Selectionner une date'),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Montant par personne',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                '$amount €',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text('Choisissez une ville'),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text('Selectionner une ville'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

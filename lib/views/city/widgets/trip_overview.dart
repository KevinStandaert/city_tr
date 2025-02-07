import 'package:city_tr/models/trip.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip;

  double get amount {
    return 0;
  }

  const TripOverview({super.key, required this.setDate, required this.myTrip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paris',
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat("dd/MM/y").format(myTrip.date),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
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
                  style: TextStyle(fontSize: 20),
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

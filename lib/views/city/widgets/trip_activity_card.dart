import 'package:city_tr/models/activity.model.dart';
import 'package:flutter/material.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  const TripActivityCard(
      {super.key, required this.activity, required this.deleteTripActivity});

  @override
  State<TripActivityCard> createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(widget.activity.name),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () => widget.deleteTripActivity(widget.activity.id),
        ),
      ),
    );
  }
}

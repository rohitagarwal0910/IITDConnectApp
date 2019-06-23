import 'package:flutter/material.dart';

import '../events/event_info.dart';
import '../events/event_class.dart';

class MyEventCard extends StatelessWidget {
  final Event _event;

  MyEventCard(this._event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventInfo(_event)));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(_event.eventName),
                  Text(_event.eventBody),
                  Text(_event.venue)
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
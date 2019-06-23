import 'package:flutter/material.dart';

import './event_class.dart';
import './event_info.dart';

class EventCard extends StatelessWidget {
  final Event _event;
  final Function _onStarPress;
  Icon _icon;

  EventCard(this._event, this._onStarPress) {
    if (_event.isStarred) {
      _icon = Icon(Icons.star);
    } else {
      _icon = Icon(Icons.star_border);
    }
  }

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
                child: Icon(Icons.calendar_today),
              ),
              GestureDetector(
                onTap: () {
                  _onStarPress(_event);
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: _icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

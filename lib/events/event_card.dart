import 'package:flutter/material.dart';

import './events_screen.dart';

class EventCard extends StatefulWidget {
  final Event event;

  EventCard(this.event);

  @override
  State<StatefulWidget> createState() {
    return EventCardState();
  }
}

class EventCardState extends State<EventCard> {
  Event _event;
  Icon _icon = Icon(Icons.star_border);

  @override
  void initState() {
    _event = widget.event;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              Text(_event.eventName),
              Text(_event.eventBody),
              Text(_event.venue)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _icon = Icon(Icons.star);
              });
            },
            child: _icon,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

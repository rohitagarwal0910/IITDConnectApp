import 'package:flutter/material.dart';

import './events_tab.dart';

class EventCard extends StatefulWidget {
  final Event _event;

  EventCard(this._event);

  @override
  State<StatefulWidget> createState() {
    return EventCardState();
  }
}

class EventCardState extends State<EventCard> {
  Event _event;
  Icon _icon;

  @override
  void initState() {
    _event = widget._event;
    if (_event.isStarred)
      _icon = Icon(Icons.star);
    else
      _icon = Icon(Icons.star_border);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            onTap: () {
              setState(() {
                _event.isStarred = !_event.isStarred; //To be changed by API Call
                if (_event.isStarred)
                  _icon = Icon(Icons.star);
                else
                  _icon = Icon(Icons.star_border);
              });
            },
            child: _icon,
          ),
        ],
      ),
    );
  }
}

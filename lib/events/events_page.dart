import 'package:flutter/material.dart';

import './events_tab.dart';
import './event_list.dart';

class EventsPage extends StatelessWidget {
  final List<Event> _events;
  final String _title;

  EventsPage(this._events, this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_title),
        Expanded(
          child: EventList(_events, _title),
        ),
      ],
    );
  }
}

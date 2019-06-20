import 'package:flutter/material.dart';

import '../events/events_tab.dart';
import './my_event_card.dart';

class MyEventsList extends StatelessWidget {
  final List<Event> _events;

  MyEventsList(this._events);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('myEventsList'),
      itemCount: _events.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return MyEventCard(_events[index]);
      },
    );
  }
}
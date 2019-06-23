import 'package:flutter/material.dart';

import './my_event_card.dart';
import '../events/event_class.dart';

class MyEventsList extends StatelessWidget {
  final List<Event> _events;

  MyEventsList(this._events);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('myEventsList'),
      itemCount: _events.length,
      padding: const EdgeInsets.all(18.0),
      itemBuilder: (BuildContext context, int index) {
        return MyEventCard(_events[index]);
      },
    );
  }
}
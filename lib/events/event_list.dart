import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_card.dart';

class EventList extends StatelessWidget {
  final List<Event> _events;

  EventList(this._events);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey(''),
      itemCount: _events.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return EventCard(_events[index]);
      },
    );
  }
}

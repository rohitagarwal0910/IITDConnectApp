import 'package:flutter/material.dart';

import './events_tab.dart';
import './event_card.dart';

class EventsList extends StatelessWidget {
  final List<Event> _events;
  final String _key;

  EventsList(this._events, this._key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey(_key),
      itemCount: _events.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return EventCard(_events[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_card.dart';

class EventList extends StatelessWidget {
  final List<Event> events;

  EventList(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events.map((element) => EventCard(element)).toList(),
    );
  }
}

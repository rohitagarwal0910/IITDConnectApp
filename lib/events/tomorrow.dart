import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TomorrowPage extends StatelessWidget {
  final List<Event> events;

  TomorrowPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('TOMORROW'),
        Expanded(
          child: EventList(events),
        ),
      ],
    );
  }
}

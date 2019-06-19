import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TodayPage extends StatelessWidget {
  final List<Event> events;

  TodayPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('TODAY'),
        Expanded(
          child: EventList(events),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class UpcomingPage extends StatelessWidget {
  final List<Event> events;

  UpcomingPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('UPCOMING'),
          EventList(events),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TomorrowPage extends StatelessWidget {
  final List<Event> events;

  TomorrowPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('TOMORROW'),
          EventList(events),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TodayPage extends StatelessWidget {
  final List<Event> events;

  TodayPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('TODAY'),
          EventList(events),
        ],
      ),
    );
  }
}

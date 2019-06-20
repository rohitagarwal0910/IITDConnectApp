import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TodayPage extends StatelessWidget {
  final List<Event> events;
  final String title = "TODAY";

  TodayPage(this.events);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        Expanded(
          child: EventList(events, title),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import './events_screen.dart';
import './event_list.dart';

class TomorrowPage extends StatelessWidget {
  final List<Event> events;
  final String title = "TOMORROW";

  TomorrowPage(this.events);

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

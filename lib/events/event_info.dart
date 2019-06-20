import 'package:flutter/material.dart';

import './events_tab.dart';

class EventInfo extends StatelessWidget {
  final Event event;

  EventInfo(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
      ),
      body: Column(
        children: <Widget>[
          Text(event.eventName),
          Text(event.about)
        ],
      ),
    );
  }
}

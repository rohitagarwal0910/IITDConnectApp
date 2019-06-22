import 'package:flutter/material.dart';

import './events_page.dart';

class EventsTab extends StatelessWidget {
  final TabController _controller;

  EventsTab(this._controller);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: [
        EventsPage('TODAY'),
        EventsPage('TOMORROW'),
        EventsPage('UPCOMING'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../profile_icon.dart';
import '../event_class.dart';
import './event_info_card.dart';
import './event_about.dart';
import './updates_class.dart';
import './event_updates_list.dart';

class EventInfo extends StatelessWidget {
  final Event _event;

  EventInfo(this._event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan[600],
        title: Text('Event'),
        centerTitle: true,
        actions: <Widget>[ProfileIcon()],
      ),
      body: ListView(
        children: <Widget>[
          EventInfoCard(_event),
          EventAbout(_event),
          EventUpdatesList(dummyUpdates)
        ],
      ),
    );
  }
}

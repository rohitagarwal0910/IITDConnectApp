import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../profile_icon.dart';
import '../../events/event_class.dart';
import './event_info_card.dart';
import '../../events/event_info/event_about.dart';
import '../../events/event_info/updates_class.dart';
import './event_updates_list.dart';

class EventInfo extends StatelessWidget {
  final Event _event;

  EventInfo(this._event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
        title: Text('Event'),
        centerTitle: true,
        actions: <Widget>[ProfileIcon()],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: <Widget>[
            EventInfoCard(_event),
            EventAbout(_event),
            EventUpdatesList(dummyUpdates)
          ],
        ),
      ),
    );
  }
}

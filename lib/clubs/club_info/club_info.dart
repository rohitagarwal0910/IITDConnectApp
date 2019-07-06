import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../club_class.dart';
import './club_about.dart';
import './club_events.dart';
import './club_info_card.dart';

import '../../events/event_class.dart';

class ClubInfo extends StatelessWidget {
  final Club _club;

  ClubInfo(this._club);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Club'),
        centerTitle: true,
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
      ),
      body: ListView(
        children: <Widget>[
          ClubInfoCard(_club),
          ClubAbout(_club.clubAbout),
          ClubEvents(events[2]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './club_class.dart';

class ClubInfo extends StatelessWidget {
  final Club club;

  ClubInfo(this.club);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(club.clubName),
        centerTitle: true,
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[Text(club.clubName), Text(club.clubAbout)],
      ),
    );
  }
}

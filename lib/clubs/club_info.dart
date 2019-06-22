import 'package:flutter/material.dart';

import './club_class.dart';

class ClubInfo extends StatelessWidget {
  final Club club;

  ClubInfo(this.club);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.clubName),
      ),
      body: Column(
        children: <Widget>[Text(club.clubName), Text(club.clubAbout)],
      ),
    );
  }
}

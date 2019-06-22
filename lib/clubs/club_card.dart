import 'package:flutter/material.dart';

import './club_class.dart';
import './club_info.dart';

class ClubCard extends StatefulWidget {
  final Club club;

  ClubCard(this.club);

  @override
  State<StatefulWidget> createState() {
    return ClubCardState();
  }
}

class ClubCardState extends State<ClubCard> {
  Club club;

  @override
  void initState() {
    club = widget.club;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ClubInfo(club)));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Text(club.clubName),
            Text(club.clubDept),
          ],
        ),
      ),
    );
  }
}

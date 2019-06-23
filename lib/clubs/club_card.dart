import 'package:flutter/material.dart';

import './club_class.dart';
import './club_info.dart';

class ClubCard extends StatelessWidget {
  final Club club;
  final Function onAddPress;
  Icon icon;

  ClubCard(this.club, this.onAddPress) {
    if (club.isSubbed)
      icon = Icon(Icons.remove_circle);
    else
      icon = Icon(Icons.add_circle_outline);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ClubInfo(club)));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Column(
                  children: <Widget>[Text(club.clubName), Text(club.clubDept)]),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onAddPress(club);
                },
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import './club_class.dart';
import './club_info/club_info.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 0.2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: AutoSizeText(club.clubName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 1,),
              ),
            ),
            IconButton(
              onPressed: () {
                onAddPress(club);
              },
              icon: icon,
              color: Colors.white,
              tooltip: 'Subscribe to Club',
              padding: EdgeInsets.all(0),
            ),
          ],
        ),
      ),
    );
  }
}

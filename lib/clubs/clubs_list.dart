import 'package:flutter/material.dart';

import './club_class.dart';
import './club_card.dart';

class ClubsList extends StatelessWidget {
  final List<Club> clubs;
  final Function onAddPress;
  final String listTitle;

  ClubsList(this.clubs, this.listTitle, this.onAddPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0x99D0D0D0),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              listTitle,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[900],
                  letterSpacing: 1),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: clubs
                  .map((element) => ClubCard(element, onAddPress))
                  .toList(),
            ),
          ),
        ],
      ),
      // ListView.builder(
      //   physics: NeverScrollableScrollPhysics(),
      //   itemCount: clubs.length,
      //   padding: const EdgeInsets.all(8.0),
      //   itemBuilder: (BuildContext context, int index) {
      //     return ClubCard(clubs[index], onAddPress);
      //   },
    );
  }
}

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
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: <Widget>[
          Text(listTitle),
          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: clubs.length,
          //   padding: const EdgeInsets.all(8.0),
          //   itemBuilder: (BuildContext context, int index) {
          //     return ClubCard(clubs[index], onAddPress);
          //   },
          Column(children: clubs.map((element) => ClubCard(element, onAddPress)).toList(),
          ),
        ],
      ),
    );
  }
}

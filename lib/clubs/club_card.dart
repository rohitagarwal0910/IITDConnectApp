import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import './club_class.dart';
import './club_info/club_info.dart';

class ClubCard extends StatelessWidget {
  final Club _club;
  final Function _onAddPress;

  ClubCard(this._club, this._onAddPress);

  @override
  Widget build(BuildContext context) {
    Icon _icon;
    if (_club.isSubbed)
      _icon = Icon(Icons.remove_circle);
    else
      _icon = Icon(Icons.add_circle_outline);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ClubInfo(_club)));
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
                child: AutoSizeText(_club.clubName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 1,),
              ),
            ),
            IconButton(
              onPressed: () {
                _onAddPress(_club);
              },
              icon: _icon,
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

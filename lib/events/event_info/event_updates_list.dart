import 'package:flutter/material.dart';

import './updates_class.dart';
import './update.dart';

class EventUpdatesList extends StatelessWidget {
  final List<Update> _updates;

  EventUpdatesList(this._updates);

  @override
  Widget build(BuildContext context) {
    if (_updates.length == 0) {
      return null;
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'UPDATES',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 4),
            ),
            Container(
              height: 3,
              width: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.blue,
            ),
            Column(
              children:
                  _updates.map((element) => EventUpdate(element)).toList(),
            )
          ],
        ),
      );
    }
  }
}

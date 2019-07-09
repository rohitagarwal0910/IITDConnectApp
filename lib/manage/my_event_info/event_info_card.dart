import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../events/event_class.dart';
import '../../events/event_card_contents/event_time.dart';
import '../../events/event_card_contents/event_venue.dart';
import '../edit_event.dart';

class EventInfoCard extends StatelessWidget {
  final Event _event;

  EventInfoCard(this._event);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                children: <Widget>[
                  AutoSizeText(
                    _event.eventName,
                    style: TextStyle(fontSize: 23, color: Colors.white),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    _event.eventBody,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  child: EventVenue(_event.venue),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 20),
                  child: EventTime(_event.startsAt, _event.endsAt),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_today),
                    color: Colors.white,
                    tooltip: 'Add to Calendar',
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEvent(_event)));
                    },
                    color: Colors.indigo[400],
                    child: Text(
                      'EDIT EVENT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

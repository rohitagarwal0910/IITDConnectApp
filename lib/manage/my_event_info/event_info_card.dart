import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../events/event_class.dart';

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
                  padding:
                      EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Text('AT',
                          style: TextStyle(color: Colors.white70, fontSize: 9)),
                      Text(
                        _event.venue,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('STARTS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 9)),
                          Text('17 Jan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                          Text('8:00 PM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      Container(
                          width: 0.5,
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.white),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('ENDS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 9)),
                          Text('18 Jan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                          Text('8:00 PM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                    tooltip: 'Edit Event Info',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


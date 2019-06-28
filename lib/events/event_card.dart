import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';

import './event_class.dart';
import './event_info.dart';

class EventCard extends StatelessWidget {
  final Event _event;
  final Function _onStarPress;
  Icon _icon;

  EventCard(this._event, this._onStarPress) {
    if (_event.isStarred) {
      _icon = Icon(Icons.star, color: Colors.amberAccent);
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventInfo(_event)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 7),
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    _event.eventName,
                    style: TextStyle(fontSize: 23, color: Colors.white),
                    maxLines: 1,
                  ),
                  Text(_event.eventBody,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width * .25,
                  child: Column(
                    children: <Widget>[
                      Text('AT',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 10)),
                      Text(_event.venue,
                        style: TextStyle(color: Colors.white, fontSize: 14,),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('STARTS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10)),
                          Text('17 Jan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Text('8:00 PM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                      Container(
                          width: 0.5,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.white),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('ENDS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10)),
                          Text('18 Jan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Text('8:00 PM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onStarPress(_event);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.only(right: 25, top: 10, bottom: 10),
                    child: _icon,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

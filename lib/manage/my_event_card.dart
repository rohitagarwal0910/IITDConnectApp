import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../events/event_info/event_info_screen.dart';
import '../events/event_class.dart';

class MyEventCard extends StatelessWidget {
  final Event _event;

  MyEventCard(this._event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventInfo(_event)));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          margin: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: AutoSizeText(
                  _event.eventName,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                  maxLines: 1,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 30, bottom: 20, top: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          Text('AT',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 9)),
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
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20, top: 10, left: 10),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('STARTS',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 9)),
                              Text('17 Jan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              Text('8:00 PM',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
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
                                      color: Colors.white70, fontSize: 9)),
                              Text('18 Jan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              Text('8:00 PM',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 25, left: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

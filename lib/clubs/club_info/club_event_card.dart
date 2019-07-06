import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../events/event_class.dart';
import '../../events/event_info/event_info_screen.dart';

class ClubEventCard extends StatelessWidget {
  final Event _event;
  Icon _icon;

  ClubEventCard(this._event) {
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: AutoSizeText(
                _event.eventName,
                style: TextStyle(fontSize: 23, color: Colors.white),
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        Text('AT',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 9)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                  color: Colors.white,
                ),
                StarButton(_event),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------

class StarButton extends StatefulWidget {
  final Event _event;

  StarButton(this._event);

  @override
  State<StatefulWidget> createState() {
    return StarButtonState();
  }
}

class StarButtonState extends State<StarButton> {
  Icon _icon;
  Event event;

  @override
  void initState() {
    event = widget._event;
    if (event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }
    super.initState();
  }

  void onStarPress() {
    event.isStarred = !event.isStarred;
    if (event.isStarred) {
      events[0].add(event);
      if (event.isBodySub) {
        events[1].remove(event);
      } else {
        events[2].remove(event);
      }
    } else {
      events[0].remove(event);
      if (event.isBodySub) {
        events[1].add(event);
      } else {
        events[2].add(event);
      }
    }
    if (event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }
    setState(() {});
    //API call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onStarPress();
      },
      icon: _icon,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

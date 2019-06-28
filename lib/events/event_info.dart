import 'package:flutter/material.dart';
import 'package:iitd_connect_flutter/clubs/club_class.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../profile_icon.dart';
import './event_class.dart';
import '../clubs/club_info.dart';

class EventInfo extends StatelessWidget {
  final Event event;

  EventInfo(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
        title: Text(event.eventName),
        centerTitle: true,
        actions: <Widget>[ProfileIcon()],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(event.eventName),
                Text(event.eventBody),
                Text(event.venue),
                // Add start and end times
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.calendar_today),
                    ),
                    StarButton(event),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClubInfo(dummyClub1)));
                      },
                      child: Text('See Club'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(event.about),
                //Event Image to be added
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StarButton extends StatefulWidget {
  final Event event;

  StarButton(this.event);

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
    event = widget.event;
    if (event.isStarred) {
      _icon = Icon(Icons.star);
    } else {
      _icon = Icon(Icons.star_border);
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
      _icon = Icon(Icons.star);
    } else {
      _icon = Icon(Icons.star_border);
    }
    setState(() {});
    //API call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onStarPress();
      },
      child: _icon,
    );
  }
}

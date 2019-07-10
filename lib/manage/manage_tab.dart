import 'package:flutter/material.dart';

import './my_events_list.dart';
import './add_event_screen.dart';
import '../events/event_class.dart';

class ManageTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManageTabState();
  }
}

class _ManageTabState extends State<ManageTab> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      key: PageStorageKey('manageTab'),
      children: <Widget>[
        FlatButton(
          color: Colors.indigo[300],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEvent()),
            ).then((value) {
              setState(() {});
            });
          },
          child: Text(
            'ADD NEW EVENT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'YOUR CLUB EVENTS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    letterSpacing: 4),
              ),
              Container(
                height: 3,
                width: 60,
                margin: EdgeInsets.only(top: 10),
                color: Colors.blue,
              ),
            ],
          ),
        ),
        MyEventsList(events[2], _refresh),
      ],
    );
  }
}

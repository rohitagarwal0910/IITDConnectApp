import 'package:flutter/material.dart';

import './event_class.dart';
import './events_list.dart';

class EventsPage extends StatefulWidget {
  final List<List<Event>> _events = events;
  final String _title;

  EventsPage(this._title);

  @override
  State<StatefulWidget> createState() {
    return EventsPageState();
  }
}

class EventsPageState extends State<EventsPage> {
  List<List<Event>> _events;
  String _title;

  @override
  void initState() {
    _events = widget._events;
    _title = widget._title;
    super.initState();
  }

  starEvent(Event event) {
    event.isStarred = !event.isStarred;
    if (event.isStarred) {
      _events[0].add(event);
      if (event.isBodySub) {
        _events[1].remove(event);
      } else {
        _events[2].remove(event);
      }
    } else {
      _events[0].remove(event);
      if (event.isBodySub) {
        _events[1].add(event);
      } else {
        _events[2].add(event);
      }
    }
    setState(() {});
    // Add API Call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: PageStorageKey(_title),
      physics: AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        EventsList(
          _events[0],
          'STARRED EVENTS',
          // _title,
          starEvent,
        ),
        EventsList(
          _events[1],
          'SUBBED',
          // _title,
          starEvent,
        ),
        EventsList(
          _events[2],
          'OTHER',
          // _title,
          starEvent,
        ),
      ],
      // SingleChildScrollView(
      //   key: PageStorageKey(_title),
      //   physics: AlwaysScrollableScrollPhysics(),
      //   child: Column(
      //     children: <Widget>[
      //       Text('STARRED EVENTS'),
      //       EventsList(_events[0], _title),
      //       Text('FROM SUBSCRIBED CLUBS'),
      //       EventsList(_events[1], _title),
      //       Text('OTHER EVENTS'),
      //       EventsList(_events[2], _title),
      //     ],
      //   ),
    );
  }
}

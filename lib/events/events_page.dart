import 'package:flutter/material.dart';
import 'package:iitd_connect_flutter/events/events_tab.dart';
import 'package:iitd_connect_flutter/globals.dart';

import './event_class.dart';
import './events_list.dart';

class EventsPage extends StatefulWidget {
  final List<List<Event>> _events;
  final String _title;
  final Function reload;

  EventsPage(this._title, this._events, this.reload);

  @override
  State<StatefulWidget> createState() {
    return EventsPageState();
  }
}

class EventsPageState extends State<EventsPage> {
  List<List<Event>> _events;
  String _title;
  Function reload;

  @override
  void initState() {
    _events = widget._events;
    _title = widget._title;
    reload = reload;
    for (int j = 0; j < 3; j++) {
      _events[j].sort((a, b) {
        return a.startsAt.compareTo(b.startsAt);
      });
    }
    super.initState();
  }

  starEvent(Event event) {
    event.isStarred = !event.isStarred;
    refreshLists(event);
    setState(() {});
    // Add API Call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // key: ,
      onRefresh: () async {await reload();},
    child:
    ListView(
      key: PageStorageKey(_title),
      children: <Widget>[
        Container(
          height: 10,
        ),
        EventsList(
          _events[0],
          'STARRED EVENTS',
          // _title,
          starEvent,
        ),
        EventsList(
          _events[1],
          'FROM SUBSCRIBTIONS',
          // _title,
          starEvent,
        ),
        EventsList(
          _events[2],
          'OTHER EVENTS',
          // _title,
          starEvent,
        ),
        Container(
          height: 5,
        ),
      ],
      // SingleChildScrollView(
      //   key: PageStorageKey(_title),
      //   physics: AlwaysScrollableScrollPhysics(),
      //   child: Column(
      //     children: <Widget>[
      //       Text('STARRED EVENTS'),
      //       EventsList(_events[0], 'STARRED', starEvent),
      //       Text('FROM SUBSCRIBED CLUBS'),
      //       EventsList(_events[1], 'SUBBED', starEvent),
      //       Text('OTHER EVENTS'),
      //       EventsList(_events[2], 'OTHER', starEvent),
      //     ],
      //   ),
    ));
  }
}

import 'package:flutter/material.dart';
import '../events/events_tab.dart';
import '../events/event_info.dart';

class MyEventCard extends StatefulWidget {
  final Event _event;

  MyEventCard(this._event);

  @override
  State<StatefulWidget> createState() {
    return MyEventCardState();
  }
}

class MyEventCardState extends State<MyEventCard> {
  Event _event;
  Icon _icon;

  @override
  void initState() {
    _event = widget._event;
    if (_event.isStarred)
      _icon = Icon(Icons.star);
    else
      _icon = Icon(Icons.star_border);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventInfo(_event)));
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(_event.eventName),
                Text(_event.eventBody),
                Text(_event.venue)
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _event.isStarred =
                      !_event.isStarred; //To be changed by API Call
                  if (_event.isStarred)
                    _icon = Icon(Icons.star);
                  else
                    _icon = Icon(Icons.star_border);
                });
              },
              child: _icon,
            ),
          ],
        ),
      ),
    );
  }
}

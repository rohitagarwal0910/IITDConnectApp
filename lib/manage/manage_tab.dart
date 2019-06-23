import 'package:flutter/material.dart';

import './my_events_list.dart';
import './add_event.dart';
import '../events/event_class.dart';

class ManageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddEvent()));},
          child: Text('Add Event'),
        ),
        Text('Your Club Events'),
        Expanded(
          child: MyEventsList(events[0]),
        ),
      ],
    );
  }
}

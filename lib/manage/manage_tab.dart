import 'package:flutter/material.dart';

import './my_events_list.dart';
import '../events/event_class.dart';

class ManageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Add Event'),
        ),
        Expanded(
          child: MyEventsList(events[0]),
        ),
      ],
    );
  }
}

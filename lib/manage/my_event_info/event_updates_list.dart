import 'package:flutter/material.dart';

import '../../events/event_info/updates_class.dart';
import './update.dart';
import './add_update.dart';

class EventUpdatesList extends StatefulWidget {
  final List<Update> _updates;

  EventUpdatesList(this._updates);

  @override
  State<StatefulWidget> createState() {
    return _EventUpdateList();
  }
}

class _EventUpdateList extends State<EventUpdatesList> {
  List<Update> _updates;

  @override
  void initState() {
    _updates = widget._updates;
    super.initState();
  }

  void _deleteUpdate(Update _update) {
    setState(() {
      _updates.remove(_update);
    });
  }

  void _addUpdate(String _text) {
    if (_text.isNotEmpty) {
      setState(() {
        _updates.add(Update(_text, DateTime.now()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_updates.length == 0) {
      return null;
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'UPDATES',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 4),
            ),
            Container(
              height: 3,
              width: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.blue,
            ),
            Column(
              children: _updates
                  .map((element) => EventUpdate(element, _deleteUpdate))
                  .toList(),
            ),
            AddUpdate(_addUpdate),
          ],
        ),
      );
    }
  }
}

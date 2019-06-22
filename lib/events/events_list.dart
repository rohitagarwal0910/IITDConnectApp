import 'package:flutter/material.dart';

import './event_card.dart';
import './event_class.dart';

class EventsList extends StatelessWidget {
  final List<Event> _events;
  // final String _key;
  final String listTitle;
  final Function _onStarPress;

  EventsList(
    this._events,
    this.listTitle,
    // this._key,
    this._onStarPress,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(),
        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: <Widget>[
          Text(listTitle),
          Column(
            children: _events
                .map((element) => EventCard(element, _onStarPress))
                .toList(),
          )
        ],
      ),

      // Column(children: _events.map((element)=>EventCard(element, _onStarPress)).toList(),
      // ListView.builder(
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   // key: PageStorageKey(_key),
      //   itemCount: _events.length,
      //   padding: const EdgeInsets.all(8.0),
      //   itemBuilder: (BuildContext context, int index) {
      //     return EventCard(_events[index]);
      //   },
    );
  }
}

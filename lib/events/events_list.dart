import 'package:flutter/cupertino.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  listTitle,
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
              ],
            ),
          ),
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

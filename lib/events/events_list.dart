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
      padding: EdgeInsets.all(18.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0x99D0D0D0),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 2, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            // decoration: BoxDecoration(
            //   color: Color(0xFFCCCCCC),
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)]
            // ),
            child: Text(
              listTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black54),
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

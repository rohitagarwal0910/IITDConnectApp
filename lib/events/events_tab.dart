import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './events_page.dart';
import './event_class.dart';

Future<List<List<List<Event>>>> getEvents() async {
  final response = await http.get("localhost:5000");

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    List<List<Event>> today = List<List<Event>>(3);
    List<List<Event>> tomorrow = List<List<Event>>(3);
    List<List<Event>> upcoming = List<List<Event>>(3);
    for (int i = 0; i < parsedJson.length; i++) {
      Event ev = Event.fromJson(parsedJson[i]);
      bool isToday = (DateTime.now().difference(ev.startsAt).inDays >= 0 &&
          DateTime.now().difference(ev.endsAt).inDays <= 0);
      bool isTommorow = (DateTime.now()
                  .add(Duration(days: 1))
                  .difference(ev.startsAt)
                  .inDays >=
              0 &&
          DateTime.now().add(Duration(days: 1)).difference(ev.endsAt).inDays <=
              0);
      bool isUpcoming =
          (DateTime.now().add(Duration(days: 1)).difference(ev.endsAt).inDays <
              0);
      if (isToday) {
        if (ev.isStarred)
          today[0].add(ev);
        else if (ev.eventBody.isSubbed)
          today[1].add(ev);
        else
          today[2].add(ev);
      }
      if (isTommorow) {
        if (ev.isStarred)
          tomorrow[0].add(ev);
        else if (ev.eventBody.isSubbed)
          tomorrow[1].add(ev);
        else
          tomorrow[2].add(ev);
      }
      if (isUpcoming) {
        if (ev.isStarred)
          upcoming[0].add(ev);
        else if (ev.eventBody.isSubbed)
          upcoming[1].add(ev);
        else
          upcoming[2].add(ev);
      }
    }
    for (int j = 0; j < 3; j++) {
      today[j].sort((a, b) {
        return a.startsAt.compareTo(b.startsAt);
      });
      tomorrow[j].sort((a, b) {
        return a.startsAt.compareTo(b.startsAt);
      });
      upcoming[j].sort((a, b) {
        return a.startsAt.compareTo(b.startsAt);
      });
    }
    return [today, tomorrow, upcoming];
  } else {
    throw Exception('Failed to load events');
  }
}

Widget makePage(Future fut, int toBuild, String title) {
  return FutureBuilder(
    future: fut,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return EventsPage("TODAY", snapshot.data[toBuild]);
      } else if (snapshot.hasError) {
        return Center(
          child: Text("Some Error Occured"),
        );
      }

      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    },
  );
}

class EventsTab extends StatelessWidget {
  final Future<List<List<List<Event>>>> events = getEvents();
  final TabController _controller;

  EventsTab(this._controller);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: [
        makePage(events, 0, 'TODAY'),
        makePage(events, 1, 'TOMORROW'),
        makePage(events, 2, 'UPCOMING'),
      ],
    );
  }
}

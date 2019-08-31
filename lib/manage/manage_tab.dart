import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iitd_connect_flutter/user_class.dart';
import 'dart:async';
import 'dart:convert';

import './my_events_list.dart';
import './add_event_screen.dart';
import '../events/event_class.dart';

Future<List<Event>> getClubEvents(String id) async {
  final response = await http
      .get("http://192.168.43.231:5000/api/events/?body=$id", headers: {
    "authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkNWNjZGJhY2UyMmJmYzI2ZjNmODI3NCIsImlhdCI6MTU2NzE0NzA2MCwiZXhwIjoxNTY3NzUxODYwfQ.1vZUiNKMhvKt_J-I0FmuZgVJVtlJge8PqSLt_wa9H40"
  });
  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    List<Event> events = List<Event>();
    if (parsedJson["message"] != "Events Found") return events;
    for (int i = 0; i < parsedJson["data"]["events"].length; i++) {
      Event ev = Event.fromJson(parsedJson["data"]["events"][i]);
      events.add(ev);
    }
    events.sort((a, b) {
      return a.startsAt.compareTo(b.startsAt);
    });
    return events;
  } else {
    throw Exception('Failed to load clubs');
  }
}

class ManageTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManageTabState();
  }
}

class _ManageTabState extends State<ManageTab> {
  Future<List<Event>> events;

  void _refresh() => setState(() {});

  @override
  void initState() {
    events = getClubEvents(user1.adminof.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      key: PageStorageKey('manageTab'),
      children: <Widget>[
        FlatButton(
          color: Colors.indigo[300],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEvent()),
            ).then((value) {
              setState(() {});
            });
          },
          child: Text(
            'ADD NEW EVENT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'YOUR CLUB EVENTS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    letterSpacing: 4),
              ),
              Container(
                height: 3,
                width: 60,
                margin: EdgeInsets.only(top: 10),
                color: Colors.blue,
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyEventsList(snapshot.data, _refresh);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Some Error Occured",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return Container(
                margin: EdgeInsets.all(20),
                child: Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )));
          },
        ),
      ],
    );
  }
}

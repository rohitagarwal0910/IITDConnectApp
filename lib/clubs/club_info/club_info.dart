import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../club_class.dart';
import './club_about.dart';
import './club_events.dart';
import './club_info_card.dart';
import '../../profile_icon.dart';
import '../../events/event_class.dart';

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

class ClubInfo extends StatefulWidget {
  final Club _club;

  ClubInfo(this._club);

  @override
  State<StatefulWidget> createState() {
    return ClubInfoState();
  }
}

class ClubInfoState extends State<ClubInfo> {
  Club _club;
  Future<List<Event>> events;

  @override
  void initState() {
    _club = widget._club;
    events = getClubEvents(_club.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Club'),
        centerTitle: true,
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
        actions: <Widget>[ProfileIcon()],
      ),
      body: ListView(
        children: <Widget>[
          ClubInfoCard(_club),
          ClubAbout(_club.clubAbout),
          FutureBuilder(
            future: events,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ClubEvents(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Could not get events",
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              }

              return Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

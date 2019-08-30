import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../profile_icon.dart';
import '../event_class.dart';
import './event_info_card.dart';
import './event_about.dart';
import './updates_class.dart';
import './event_updates_list.dart';

Future<Event> getEvent() async {
  final response = await http.get("http://192.168.43.231:5000/api/events",
      headers: {"authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkNWNjZGJhY2UyMmJmYzI2ZjNmODI3NCIsImlhdCI6MTU2NzE0NzA2MCwiZXhwIjoxNTY3NzUxODYwfQ.1vZUiNKMhvKt_J-I0FmuZgVJVtlJge8PqSLt_wa9H40"});

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    Event event = Event.fromJson(parsedJson["data"]["events"][0]);
    return event;
  } else {
    throw Exception("Failed to load Event");
  }
}

class EventInfo extends StatelessWidget {
  final Event _event;
  final Future<Event> _ev = getEvent();

  EventInfo(this._event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
        title: Text('Event'),
        centerTitle: true,
        actions: <Widget>[ProfileIcon()],
      ),
      body: FutureBuilder(
        future: _ev,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                EventInfoCard(snapshot.data),
                EventAbout(snapshot.data),
                EventUpdatesList(dummyUpdates)
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Some Error Occured"),
            );
          }

          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        },
      ),
    );
  }
}

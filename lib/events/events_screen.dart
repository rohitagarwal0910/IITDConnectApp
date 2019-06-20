import 'package:flutter/material.dart';

import './today.dart';
import './tomorrow.dart';
import './upcoming.dart';

// dummy event class and two dummy events

class Event {
  String eventName;
  String venue;
  String about;
  bool isStarred;
  String eventBody;

  Event(
      {this.eventName, this.eventBody, this.venue, this.about, this.isStarred});
}

var dummyEvent = Event(
    eventName: 'Event1',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false);

var dummyEvent2 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);

var dummyEvent3 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);

var dummyEvent4 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);

var dummyEvent5 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);

var dummyEvent6 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);
var dummyEvent7 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);
var dummyEvent8 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);
var dummyEvent9 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);
var dummyEvent10 = Event(
    eventName: 'Event2',
    eventBody: 'Club2',
    venue: 'Ground',
    about: 'jhkbj2',
    isStarred: false);

List<Event> events = [dummyEvent, dummyEvent2, dummyEvent3, dummyEvent4, dummyEvent5, dummyEvent6, dummyEvent7, dummyEvent8, dummyEvent9, dummyEvent10, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2, dummyEvent2];

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      key: PageStorageKey('value'),
      children: <Widget>[
        TodayPage(events),
        TomorrowPage(events),
        UpcomingPage(events),
      ],
    );
  }
}

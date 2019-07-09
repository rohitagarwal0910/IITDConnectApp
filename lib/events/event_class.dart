class Event {
  String eventName;
  String eventBody;
  String venue;
  DateTime startsAt = DateTime.now();
  DateTime endsAt = DateTime.now();
  String about;
  String imageLink = 'https://picsum.photos/250?image=10';
  bool isStarred;
  bool isBodySub;

  Event(
      {this.eventName, this.eventBody, this.venue, this.about, this.isStarred, this.isBodySub,});
}

var dummyEvent1 = Event(
    eventName: 'Event1',
    eventBody: 'Club1',
    venue: 'LHC',
    about: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    isStarred: false,
    isBodySub: false);

var dummyEvent2 = Event(
    eventName: 'Campus Hackathon',
    eventBody: 'DevClub',
    venue: 'LT6 Block-II',
    about: 'jhkbj',
    isStarred: true,
    isBodySub: false);

var dummyEvent3 = Event(
    eventName: 'Event3',
    eventBody: 'Club1',
    venue: 'LHrwebferbgeberbergergererrbfC',
    about: 'jhkbj',
    isStarred: true,
    isBodySub: false);

var dummyEvent4 = Event(
    eventName: 'Event4',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: true,
    isBodySub: false);

var dummyEvent5 = Event(
    eventName: 'Event5',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: true,
    isBodySub: true);

var dummyEvent6 = Event(
    eventName: 'Event6',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: true,
    isBodySub: true);

var dummyEvent7 = Event(
    eventName: 'Event7',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent8 = Event(
    eventName: 'Event8',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent9 = Event(
    eventName: 'Event9',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent10 = Event(
    eventName: 'Event10',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent11 = Event(
    eventName: 'Dance Competition',
    eventBody: 'Dance Club',
    venue: 'Seminar Hall',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: true);

var dummyEvent12 = Event(
    eventName: 'Paint Job',
    eventBody: 'Fine Arts Club',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: true);

var dummyEvent13 = Event(
    eventName: 'Street Play',
    eventBody: 'Dramatics Society',
    venue: 'SAC Lawns',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: true);

var dummyEvent14 = Event(
    eventName: 'Event14',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent15 = Event(
    eventName: 'Event15',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

var dummyEvent16 = Event(
    eventName: 'Event16',
    eventBody: 'Club1',
    venue: 'LHC',
    about: 'jhkbj',
    isStarred: false,
    isBodySub: false);

List<Event> starEvents = [dummyEvent2,dummyEvent3,dummyEvent4,dummyEvent5,dummyEvent6];
List<Event> subbedEvents = [dummyEvent11,dummyEvent12,dummyEvent13];
List<Event> otherEvents = [dummyEvent1,dummyEvent7,dummyEvent8,dummyEvent9,dummyEvent10,dummyEvent14,dummyEvent15,dummyEvent16];

List<List<Event>> events = [starEvents, subbedEvents, otherEvents];

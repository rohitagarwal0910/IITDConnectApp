import 'events/event_class.dart';

List<List<Event>> todayEvents = List<List<Event>>.generate(3, (i) => []);
List<List<Event>> tomorrowEvents = List<List<Event>>.generate(3, (i) => []);
List<List<Event>> upcomingEvents = List<List<Event>>.generate(3, (i) => []);

void refreshLists(Event event) {
  bool isToday = (DateTime.now().difference(event.startsAt).inDays >= 0 &&
      DateTime.now().difference(event.endsAt).inDays <= 0);
  bool isTommorow = (DateTime.now()
              .add(Duration(days: 1))
              .difference(event.startsAt)
              .inDays >=
          0 &&
      DateTime.now().add(Duration(days: 1)).difference(event.endsAt).inDays <=
          0);
  bool isUpcoming =
      (DateTime.now().add(Duration(days: 1)).difference(event.endsAt).inDays <
          0);
  if (isToday) _refreshList(todayEvents, event);
  if (isTommorow) _refreshList(tomorrowEvents, event);
  if (isUpcoming) _refreshList(upcomingEvents, event);
}

void _refreshList(List<List<Event>> list, Event event) {
  if (event.isStarred) {
    list[0].add(event);
    if (event.isBodySub) {
      list[1].remove(event);
    } else {
      list[2].remove(event);
    }
  } else {
    list[0].remove(event);
    if (event.isBodySub) {
      list[1].add(event);
    } else {
      list[2].add(event);
    }
  }
  for (int j = 0; j < 3; j++) {
    list[j].sort((a, b) {
      return a.startsAt.compareTo(b.startsAt);
    });
  }
}

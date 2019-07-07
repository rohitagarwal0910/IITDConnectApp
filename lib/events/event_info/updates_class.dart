class Update {
  String message;
  DateTime dateTime;

  Update(this.message, this.dateTime);
}

var dummyUpdate = Update(
    'The event has been postponed and will now start at 9:00 PM',
    DateTime.parse("2019-01-17 20:18"));

List<Update> dummyUpdates = [dummyUpdate, dummyUpdate, dummyUpdate,];
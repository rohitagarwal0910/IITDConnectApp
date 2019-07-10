import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

import '../events/event_class.dart';
import '../user_class.dart';

class EventForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventFormState();
  }
}

class _EventFormState extends State<EventForm> {
  String _eventName;
  String _eventBody;
  String _venue;
  DateTime _startsAt;
  DateTime _endsAt;
  String _about;
  String _imageLink;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Event Name',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onSaved: (text) {
                _eventName = text;
              },
              validator: (text) {
                if (text.isEmpty)
                  return 'Required';
                else
                  return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Venue'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onSaved: (text) {
                _venue = text;
              },
              validator: (text) {
                if (text.isEmpty)
                  return 'Required';
                else
                  return null;
              },
            ),
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("d MMMM, yyyy 'at' h:mm a"),
              editable: false,
              firstDate: DateTime.now(),
              decoration: InputDecoration(
                labelText: 'Starts At',
                hasFloatingPlaceholder: true,
              ),
              style: TextStyle(color: Colors.white),
              onSaved: (dt) {
                _startsAt = dt;
              },
              validator: (dt) {
                if (dt == null)
                  return 'Required';
                else
                  return null;
              },
            ),
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("d MMMM, yyyy 'at' h:mm a"),
              editable: false,
              decoration: InputDecoration(
                labelText: 'Ends At',
                hasFloatingPlaceholder: true,
              ),
              style: TextStyle(color: Colors.white),
              onSaved: (dt) {
                _endsAt = dt;
              },
              validator: (dt) {
                if (dt == null)
                  return 'Required';
                else
                  return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Event About'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSaved: (text) {
                _about = text;
              },
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Image Link'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onSaved: (text) {
                _imageLink = text;
              },
              validator: (text) {
                if (text.isEmpty || isURL(text)) {
                  return null;
                } else {
                  return 'Not a valid URL';
                }
              },
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showCancelAlert(context);
                    },
                    child: Text('CANCEL'),
                    color: Colors.indigo[100],
                  ),
                  RaisedButton(
                    color: Colors.indigo[400],
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        events[2].add(Event(
                            eventName: _eventName,
                            eventBody: user1.adminof.clubName,
                            venue: _venue,
                            about: _about,
                            isBodySub: false,
                            isStarred: false));
                        Navigator.pop(context);
                      }
                    },
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

Future<bool> showCancelAlert(BuildContext context) {
  return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.indigo[600],
            title: Text(
              'Cancel making new ',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Are you sure you want to discard new changes?',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'NO',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'YES',
                  style: TextStyle(color: Colors.white70),
                ),
              )
            ],
          );
        },
      ) ??
      false;
}

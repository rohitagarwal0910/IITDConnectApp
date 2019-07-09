import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../events/event_class.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class EditEvent extends StatelessWidget {
  final Event _event;

  EditEvent(this._event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Edit Event'),
        centerTitle: true,
        backgroundColorStart: Colors.indigo,
        backgroundColorEnd: Colors.cyan,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: <Widget>[EditEventForm(_event)],
        ),
      ),
    );
  }
}

class EditEventForm extends StatefulWidget {
  final Event _event;

  EditEventForm(this._event);

  @override
  State<StatefulWidget> createState() {
    return _EditEventFormState();
  }
}

class _EditEventFormState extends State<EditEventForm> {
  String _eventName;
  String _venue;
  DateTime _startsAt;
  DateTime _endsAt;
  String _about;
  String _imageLink;

  Event _event;

  @override
  void initState() {
    _event = widget._event;
    super.initState();
  }

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
              initialValue: _event.eventName,
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
              initialValue: _event.venue,
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
              initialValue: _event.startsAt,
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
                if (dt == null) {
                  _startsAt = null;
                  return 'Required';
                } else {
                  _startsAt = dt;
                  return null;
                }
              },
            ),
            DateTimePickerFormField(
              initialValue: _event.endsAt,
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
                if (dt == null) {
                  return 'Required';
                } else if (_startsAt != null && dt.isBefore(_startsAt)) {
                  return 'Event should end after it starts';
                } else if (dt.isBefore(DateTime.now())) {
                  return 'Event has already ended';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              initialValue: _event.about,
              decoration: InputDecoration(labelText: 'Event About'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSaved: (text) {
                _about = text;
              },
              style: TextStyle(color: Colors.white),
              validator: (text) {
                if (text.isEmpty)
                  return 'Required';
                else
                  return null;
              },
            ),
            TextFormField(
              initialValue: _event.imageLink,
              decoration: InputDecoration(labelText: 'Image Link'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onSaved: (text) {
                _imageLink = text;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _showDeleteAlert(context, _event);
                  },
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red[300],
                ),
                RaisedButton(
                    onPressed: () {
                      _showCancelAlert(context);
                    },
                    child: Text('CANCEL'),
                    color: Colors.indigo[100]),
                RaisedButton(
                  color: Colors.indigo[400],
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      _key.currentState.save();
                      _event.eventName = _eventName;
                      _event.venue = _venue;
                      _event.about = _about;
                      _event.startsAt = _startsAt;
                      _event.endsAt = _endsAt;
                      _event.imageLink = _imageLink;
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showCancelAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.indigo[600],
        title: Text(
          'Cancel editing',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to discard new changes?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
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
  );
}

void _showDeleteAlert(BuildContext context, Event _event) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.indigo[600],
        title: Text(
          'Delete Event',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to delete this event?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'NO',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          FlatButton(
            onPressed: () {
              events[2].remove(_event);
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            },
            child: Text(
              'YES',
              style: TextStyle(color: Colors.white70),
            ),
          )
        ],
      );
    },
  );
}

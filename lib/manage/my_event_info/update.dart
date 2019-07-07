import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../events/event_info/updates_class.dart';

class EventUpdate extends StatelessWidget {
  final Update _update;
  final Function _deleteUpdate;

  EventUpdate(this._update, this._deleteUpdate);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.only(top: 15, left: 25, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0x22AAAAAA)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  _update.message,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white70,
                ),
                onSelected: (a) => _showAlert(context, _deleteUpdate, _update),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '',
                        child: Text('Delete Update'),
                      )
                    ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                DateFormat('d MMM').format(_update.dateTime),
                style: TextStyle(fontSize: 10, color: Colors.white54),
              ),
              Text(
                ' • ',
                style: TextStyle(color: Colors.white54),
              ),
              Text(
                DateFormat('h:mm a').format(_update.dateTime),
                style: TextStyle(fontSize: 10, color: Colors.white54),
              ),
              Container(
                width: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}

void _showAlert(BuildContext context, Function _deleteUpdate, Update _update,) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.indigo,
        title: Text(
          'Delete Update',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to delete this update?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'CANCEL',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          FlatButton(
            onPressed: () {
              _deleteUpdate(_update);
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

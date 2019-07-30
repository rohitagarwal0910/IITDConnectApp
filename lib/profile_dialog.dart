import 'package:flutter/material.dart';

import './user_class.dart';

void showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.indigo[600],
        titlePadding: EdgeInsets.only(
          top: 20,
          bottom: 20
        ),
        contentPadding: EdgeInsets.only(top: 5, bottom: 20),
        title: Text(
          user1.name,
          style: TextStyle(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              color: Colors.indigo[400],
              child: Text(
                'LOGOUT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}

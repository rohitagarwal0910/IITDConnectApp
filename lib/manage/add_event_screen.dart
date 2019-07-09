import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './add_event_form.dart';
// import '../events/event_class.dart';

class AddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Add Event'),
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
          children: <Widget>[EventForm()],
        ),
      ),
    );
  }
}

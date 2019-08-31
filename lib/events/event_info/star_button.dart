import 'package:flutter/material.dart';
import 'package:iitd_connect_flutter/events/events_page.dart';

import '../event_class.dart';
import 'package:iitd_connect_flutter/globals.dart';

class StarButton extends StatefulWidget {
  final Event _event;

  StarButton(this._event);

  @override
  State<StatefulWidget> createState() {
    return StarButtonState();
  }
}

class StarButtonState extends State<StarButton> {
  Icon _icon;
  String _toolTip;
  Event event;

  @override
  void initState() {
    event = widget._event;
    if (event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
      _toolTip = 'Unstar';
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
      _toolTip = 'Star';
    }
    super.initState();
  }

  void onStarPress() {
    event.isStarred = !event.isStarred;
    refreshLists(event);
    if (event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
      _toolTip = 'Unstar';
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
      _toolTip = 'Star';
    }
    setState(() {});
    //API call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onStarPress();
      },
      icon: _icon,
      tooltip: _toolTip,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

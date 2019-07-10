import 'package:flutter/material.dart';

import '../event_class.dart';

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
    if (event.isStarred) {
      events[0].add(event);
      if (event.isBodySub) {
        events[1].remove(event);
      } else {
        events[2].remove(event);
      }
    } else {
      events[0].remove(event);
      if (event.isBodySub) {
        events[1].add(event);
      } else {
        events[2].add(event);
      }
    }
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

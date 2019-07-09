import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../events/event_class.dart';
import '../../events/event_info/event_info_screen.dart';
import '../../events/event_card_contents/event_time.dart';
import '../../events/event_card_contents/event_venue.dart';

class ClubEventCard extends StatelessWidget {
  final Event _event;

  ClubEventCard(this._event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventInfo(_event)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: AutoSizeText(
                _event.eventName,
                style: TextStyle(fontSize: 23, color: Colors.white),
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: EventVenue(_event.venue),
                ),
                Expanded(
                  child: EventTime(_event.startsAt, _event.endsAt),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                  color: Colors.white,
                ),
                StarButton(_event),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------

class StarButton extends StatefulWidget {
  final Event _event;

  StarButton(this._event);

  @override
  State<StatefulWidget> createState() {
    return _StarButtonState();
  }
}

class _StarButtonState extends State<StarButton> {
  Icon _icon;
  Event _event;

  @override
  void initState() {
    _event = widget._event;
    if (_event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }
    super.initState();
  }

  void _onStarPress() {
    _event.isStarred = !_event.isStarred;
    if (_event.isStarred) {
      events[0].add(_event);
      if (_event.isBodySub) {
        events[1].remove(_event);
      } else {
        events[2].remove(_event);
      }
    } else {
      events[0].remove(_event);
      if (_event.isBodySub) {
        events[1].add(_event);
      } else {
        events[2].add(_event);
      }
    }
    if (_event.isStarred) {
      _icon = Icon(
        Icons.star,
        color: Colors.amberAccent,
      );
    } else {
      _icon = Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }
    setState(() {});
    //API call to make this change
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _onStarPress();
      },
      icon: _icon,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

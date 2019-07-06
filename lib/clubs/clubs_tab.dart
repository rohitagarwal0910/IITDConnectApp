import 'package:flutter/material.dart';

import './club_class.dart';
import './clubs_list.dart';

class ClubsTab extends StatefulWidget {
  final List<List<Club>> clubs = dummyClubs;

  @override
  State<StatefulWidget> createState() {
    return ClubsTabState();
  }
}

class ClubsTabState extends State<ClubsTab> {
  List<List<Club>> _clubs;

  @override
  void initState() {
    _clubs = widget.clubs;
    // _title = widget._title;
    super.initState();
  }

  subClub(Club club) {
    club.isSubbed = !club.isSubbed;
    if (club.isSubbed) {
      _clubs[0].add(club);
      _clubs[1].remove(club);
    } else {
      _clubs[0].remove(club);
      _clubs[1].add(club);
    }
    setState(() {});
  }
  // Add API Call to make this change

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: PageStorageKey('clubsTab'),
      physics: AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          height: 5,
        ),
        ClubsList(
          _clubs[0],
          'SUBSCRIBED CLUBS',
          subClub,
        ),
        ClubsList(
          _clubs[1],
          'OTHER CLUBS',
          subClub,
        ),
        Container(
          height: 5,
        ),
      ],
    );
  }
}

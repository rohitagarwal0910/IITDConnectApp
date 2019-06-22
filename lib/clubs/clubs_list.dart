import 'package:flutter/material.dart';

import './club_class.dart';
import './club_card.dart';

class ClubsList extends StatelessWidget {
  final List<Club> clubs=dummyClubs;

  // ClubsList(this.clubs);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('clubsList'),
      itemCount: clubs.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return ClubCard(clubs[index]);
      },
    );
  }
}
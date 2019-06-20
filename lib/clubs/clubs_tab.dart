import 'package:flutter/material.dart';
import './clubs_list.dart';

class Club {
  String clubName;
  String clubDept;
  String clubAbout;

  Club({this.clubName, this.clubDept, this.clubAbout});
}

var dummyClub1 =
    Club(clubName: 'Club1', clubDept: 'Dept1', clubAbout: 'wqewdqwe');
var dummyClub2 =
    Club(clubName: 'Club2', clubDept: 'Dept2', clubAbout: 'wqewdqwe');

List<Club> clubs = [
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
  dummyClub1,
  dummyClub2,
];

class ClubsTab extends StatelessWidget {
  final String title = 'Clubs';

  @override
  Widget build(BuildContext context) {
    return ClubsList(clubs);
  }
}

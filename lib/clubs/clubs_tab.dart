import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:iitd_connect_flutter/globals.dart';
import './club_class.dart';
import './clubs_list.dart';

Future<List<List<Club>>> getClubs() async {
  final response = await http.get("url");

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    List<Club> subbedClubs = List<Club>();
    List<Club> otherClubs = List<Club>();
    for (int i = 0; i < parsedJson.length; i++) {
      Club club = Club.fromJson(parsedJson[i]);
      if (club.isSubbed)
        subbedClubs.add(club);
      else
        otherClubs.add(club);
    }
    subbedClubs.sort((a, b) {
      return a.clubName.toLowerCase().compareTo(b.clubName.toLowerCase());
    });
    otherClubs.sort((a, b) {
      return a.clubName.toLowerCase().compareTo(b.clubName.toLowerCase());
    });
    return [subbedClubs, otherClubs];
  } else {
    throw Exception('Failed to load clubs');
  }
}

class ClubsTab extends StatefulWidget {
  final Future<List<List<Club>>> clubs = getClubs();

  @override
  State<StatefulWidget> createState() {
    return ClubsTabState();
  }
}

class ClubsTabState extends State<ClubsTab> {
  Future<List<List<Club>>> _clubs;

  @override
  void initState() {
    _clubs = widget.clubs;
    // _title = widget._title;
    super.initState();
  }

  subClub(Club club) {
    // club.isSubbed = !club.isSubbed;
    // if (club.isSubbed) {
    //   _clubs[0].add(club);
    //   _clubs[1].remove(club);
    // } else {
    //   _clubs[0].remove(club);
    //   _clubs[1].add(club);
    // }
    setState(() {});
  }
  // Add API Call to make this change

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _clubs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            key: PageStorageKey('clubsTab'),
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                height: 5,
              ),
              ClubsList(
                snapshot.data[0],
                'SUBSCRIBED CLUBS',
                subClub,
              ),
              ClubsList(
                snapshot.data[1],
                'OTHER CLUBS',
                subClub,
              ),
              Container(
                height: 5,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Some Error Occured", style: TextStyle(color: Colors.white70),),
          );
        }

        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
      },
    );

    // ListView(
    //   key: PageStorageKey('clubsTab'),
    //   physics: AlwaysScrollableScrollPhysics(),
    //   children: <Widget>[
    //     Container(
    //       height: 5,
    //     ),
    //     ClubsList(
    //       _clubs[0],
    //       'SUBSCRIBED CLUBS',
    //       subClub,
    //     ),
    //     ClubsList(
    //       _clubs[1],
    //       'OTHER CLUBS',
    //       subClub,
    //     ),
    //     Container(
    //       height: 5,
    //     ),
    //   ],
    // );
  }
}

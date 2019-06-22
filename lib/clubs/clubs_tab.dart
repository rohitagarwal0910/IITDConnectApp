import 'package:flutter/material.dart';

import './clubs_list.dart';

class ClubsTab extends StatelessWidget {
  final String title = 'Clubs';

  @override
  Widget build(BuildContext context) {
    return ClubsList();
  }
}

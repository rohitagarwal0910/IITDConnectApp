import 'package:flutter/material.dart';

import './profile_page.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));}
    );
  }
}
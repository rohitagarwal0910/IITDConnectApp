import 'package:flutter/material.dart';

import './events/events_screen.dart';
import './clubs_screen.dart';
import './manage_events.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedScreen = 1;
  final List<Widget> _screens = [ClubsPage(), EventsPage(), MyEventsPage()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      title: 'IITD Connect',
      home: Scaffold(
        appBar: AppBar(
          title: Text('IITD Connect'),
        ),
        body: _screens[_selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreen,
          onTap: (int index) {
            setState(() {
              _selectedScreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Clubs'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Events'),
            ),
            BottomNavigationBarItem(
                //If admin account
                icon: Icon(Icons.edit),
                title: Text('Manage'))
          ],
        ),
      ),
    );
  }
}

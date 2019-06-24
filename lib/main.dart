import 'package:flutter/material.dart';

import './events/events_tab.dart';
import './clubs/clubs_tab.dart';
import './manage/manage_tab.dart';
import './profile_page.dart';
import './profile_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController _controller;
  int _selectedTab = 1;
  List<Widget> _tabs;

  Widget appBar;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    appBar = AppBar(
      title: Text('IITD Connect'),
      actions: <Widget>[ProfileIcon()],
      bottom: TabBar(
        controller: _controller,
        tabs: [
          Tab(text: 'TODAY'),
          Tab(text: 'TOMORROW'),
          Tab(text: 'UPCOMING'),
        ],
      ),
    );
    _tabs = [ClubsTab(), EventsTab(_controller), ManageTab()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      title: 'IITD Connect',
      home: Scaffold(
        appBar: appBar,
        body: _tabs[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
              if (index == 1)
                appBar = AppBar(
                  title: Text('IITD Connect'),
                  actions: <Widget>[ProfileIcon()],
                  bottom: TabBar(
                    controller: _controller,
                    tabs: [
                      Tab(text: 'TODAY'),
                      Tab(text: 'TOMORROW'),
                      Tab(text: 'UPCOMING'),
                    ],
                  ),
                );
              else
                appBar = AppBar(
                  title: Text('IITD Connect'),
                  actions: <Widget>[ProfileIcon()],
                );
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

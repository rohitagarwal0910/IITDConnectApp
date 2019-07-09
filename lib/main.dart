import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './events/events_tab.dart';
import './clubs/clubs_tab.dart';
import './manage/manage_tab.dart';
import './profile_icon.dart';
import './user_class.dart';

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
  List<BottomNavigationBarItem> _navBarItems;

  Widget appBar;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    appBar = GradientAppBar(
      elevation: 10,
      title: Text('IITD Connect'),
      backgroundColorStart: Colors.indigo,
      backgroundColorEnd: Colors.cyan,
      actions: <Widget>[ProfileIcon()],
      bottom: TabBar(
        indicatorColor: Colors.white70,
        controller: _controller,
        tabs: [
          Tab(text: 'TODAY'),
          Tab(text: 'TOMORROW'),
          Tab(text: 'UPCOMING'),
        ],
      ),
    );
    _tabs = [ClubsTab(), EventsTab(_controller)];
    _navBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        title: Text('Clubs'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        title: Text('Events'),
      ),
    ];
    if (user1.isAdmin) {
      _tabs.add(ManageTab());
      _navBarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.edit),
        title: Text('Manage'),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          hintColor: Colors.white54,
          scaffoldBackgroundColor: Colors.indigo[900]),
      title: 'IITD Connect',
      home: Scaffold(
        appBar: appBar,
        body: _tabs[_selectedTab],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
          child: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (int index) {
              setState(() {
                _selectedTab = index;
                if (index == 1)
                  appBar = GradientAppBar(
                    title: Text('IITD Connect'),
                    backgroundColorStart: Colors.indigo,
                    backgroundColorEnd: Colors.cyan,
                    elevation: 10,
                    actions: <Widget>[ProfileIcon()],
                    bottom: TabBar(
                      indicatorColor: Colors.white70,
                      controller: _controller,
                      tabs: [
                        Tab(text: 'TODAY'),
                        Tab(text: 'TOMORROW'),
                        Tab(text: 'UPCOMING'),
                      ],
                    ),
                  );
                else
                  appBar = GradientAppBar(
                    title: Text('IITD Connect'),
                    elevation: 10,
                    backgroundColorStart: Colors.indigo,
                    backgroundColorEnd: Colors.cyan,
                    actions: <Widget>[ProfileIcon()],
                  );
              });
            },
            items: _navBarItems,
          ),
        ),
      ),
    );
  }
}

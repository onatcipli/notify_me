import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/pages/home.dart';
import 'package:notify_me/pages/profile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  /// We are changing the page with [_selectedIndex]
  /// also it activates the current [BottomNavyBarItem]
  int _selectedIndex = 0;

  /// It help us to animate between pages when we are changing tabs
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Home(),
              ProfilePage(),
            ],
            dragStartBehavior: DragStartBehavior.down,
          ),
          bottomNavigationBar: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.notifications_active,
                    color: _selectedIndex == 0 ? Colors.black : Colors.black45,
                    size: 40,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: _selectedIndex == 1 ? Colors.black : Colors.black45,
                    size: 40,
                  ),
                ),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 0),
              ),
              onTap: (idx) => setState(() {
                    _selectedIndex = idx;
                  })),
        ),
      ),
      length: 2,
      initialIndex: _selectedIndex,
    );
    ;
  }
}

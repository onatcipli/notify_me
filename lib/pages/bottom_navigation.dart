import 'package:flutter/material.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/pages/create_notification_page.dart';
import 'package:notify_me/pages/explore_page.dart';
import 'package:notify_me/pages/profile_page.dart';
import 'package:notify_me/shared/noti_icons_icons.dart';
import 'package:notify_me/widgets/bottom_navi_bar.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        showElevation: true,
        // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(NotiIcons.compass_1),
              title: Text('Explore'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
          BottomNavyBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              title: Text('Create'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
          BottomNavyBarItem(
              icon: Icon(NotiIcons.profile),
              title: Text('Profile'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: <Widget>[
          //TODO: change the pages later
          SafeArea(
            child: ExplorePage(),
          ),
          SafeArea(
            child: CreateNotification(),
          ),
          ProfilePage(
            userModel: UserModel.fromJson(userJson),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notify_me/helper/app_localization.dart';
import 'package:notify_me/pages/profile.dart';
import 'package:notify_me/shared/noti_icons_icons.dart';
import 'package:notify_me/widgets/bottom.navi.bar.dart';

import 'home.dart';

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

  bool _isEditMode = false;

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
            title: Text(AppLocalizations.of(context).translate('explore')),
            activeColor: Theme.of(context).primaryColorLight,
            inactiveColor: Theme.of(context).primaryColorDark.withOpacity(.5),
          ),
          BottomNavyBarItem(
            icon: Icon(NotiIcons.profile),
            title: Text(AppLocalizations.of(context).translate('profile')),
            activeColor: Theme.of(context).primaryColorLight,
            inactiveColor: Theme.of(context).primaryColorDark.withOpacity(.5),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: <Widget>[
          Home(
            directToProfileWithEditMode: () {
              setState(() {
                _selectedIndex = 1;
                _isEditMode = true;
              });
              _pageController.animateToPage(_selectedIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            },
          ),
          SafeArea(
            child: ProfilePage(
              isEditMode: _isEditMode,
            ),
          ),
        ],
      ),
    );
  }
}

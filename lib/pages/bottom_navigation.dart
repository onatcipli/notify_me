import 'package:flutter/material.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/pages/create_notification_page.dart';
import 'package:notify_me/pages/explore_page.dart';
import 'package:notify_me/pages/profile_page.dart';
import 'package:notify_me/widgets/bottom_navi_bar.dart';
import 'package:notify_me/widgets/deck_of_cards.dart';

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
              icon: Icon(Icons.info_outline),
              title: Text('Explore'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
          BottomNavyBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text('Create'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
          BottomNavyBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey.withOpacity(.5)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: <Widget>[
          //TODO: change the pages later
          SafeArea(
            child: ExplorePage(),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Expanded(
                  child: DeckOfCards(
                    deckCount: 3,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.green,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.black,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.brown,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ProfilePage(
            userModel: UserModel.fromJson(userJson),
          ),
        ],
      ),
    );
  }
}

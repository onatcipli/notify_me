import 'package:flutter/material.dart';
import 'package:notify_me/pages/bottom_navigation.dart';
import 'package:notify_me/shared/notify_light_theme.dart';

void main() => runApp(NotifyMeApp());

class NotifyMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      title: "NotifyMe",
      home: BottomNavigation(),
    );
  }
}

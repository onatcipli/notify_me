import 'package:flutter/material.dart';
import 'package:notify_me/pages/notify_me_home.dart';

void main() => runApp(NotifyMeApp());

class NotifyMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NotifyMe",
      home: NotifyMeHome(),
    );
  }
}

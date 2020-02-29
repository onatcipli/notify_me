import 'package:flutter/material.dart';

class NavigatorHelper {
  static dynamic makeRootPage(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}

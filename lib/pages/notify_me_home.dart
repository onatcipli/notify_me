import 'package:flutter/material.dart';
import 'package:notify_me/widgets/build_favorites.dart';

class NotifyMeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BuildFavorites(),
      ),
    );
  }
}

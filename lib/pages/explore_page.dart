import 'package:flutter/material.dart';
import 'package:notify_me/widgets/build_favorite_notifications.dart';
import 'package:notify_me/widgets/build_notifications.dart';


class ExplorePage extends StatelessWidget {
  const ExplorePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BuildFavoriteNotifications(),
        Expanded(child: BuildNotifications()),
      ],
    );
  }
}

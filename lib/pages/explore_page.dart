import 'package:flutter/material.dart';
import 'package:notify_me/widgets/build_favorites.dart';
import 'package:notify_me/widgets/build_regular_notify_cards.dart';


class ExplorePage extends StatelessWidget {
  const ExplorePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BuildFavorites(),
        BuildRegularNotifyCards(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/widgets/regular_notify_card.dart';

class BuildRegularNotifyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notifyListJson.length,
        itemBuilder: (BuildContext context, int index) {
          return RegularNotifyCard(
              notifyCardModel:
                  NotifyCardModel.fromJson(notifyListJson.elementAt(index)));
        },
      ),
    );
  }
}

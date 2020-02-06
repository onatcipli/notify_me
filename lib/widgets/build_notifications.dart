import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/notification_cards/notification_card.dart';

class BuildNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: notifyListJson.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0,4,0,4),
              child: NotificationCard(
                notificationModel: NotificationModel.fromJson(
                  notifyListJson.elementAt(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

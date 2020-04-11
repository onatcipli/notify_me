import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';

class NotificationDetailPage extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationDetailPage({Key key, this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notificationModel.ownerTitle),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                notificationModel.time.minute.toString() + 'm',
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            notificationModel.title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Hero(
                        tag: notificationModel.id,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.height / 6,
                          child: CircleAvatar(
                            backgroundImage:
                            NetworkImage(notificationModel.profileImageUrl),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                notificationModel.subTitle,
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

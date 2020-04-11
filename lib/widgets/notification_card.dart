import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify_me/pages/notification_detail_page.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationCard({Key key, this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = 115.0;
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundImage: notificationModel.profileImageUrl ==
                                  null
                              ? AssetImage("images/default-profile.png")
                              : NetworkImage(notificationModel.profileImageUrl),
                        ),
                      ),
                      Text(
                        //TODO : change with username
                        notificationModel.title.length > 10
                            ? '@' +
                                notificationModel.ownerTitle.substring(0, 10)
                            : '@' + notificationModel.ownerTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          notificationModel.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notificationModel.subTitle,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Text(
              notificationModel.time.minute.toString() + 'm',
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}

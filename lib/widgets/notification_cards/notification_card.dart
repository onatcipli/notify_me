import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/notification_cards/vote_part.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationCard({Key key, this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = 115.0;
    return Container(
      height: height,
      child: Card(
        elevation: 5,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 32,
                          width: 32,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(notificationModel.profileImageUrl),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '~' + notificationModel.subTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '@' + notificationModel.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        notificationModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  VotePart()
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width / 3,
                  height: height,
                  fit: BoxFit.fill,
                  imageUrl: notificationModel.backgroundImageUrl,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,8,0,0),
                      child: Icon(Icons.more_vert),
                    ),
                    onTap: () {},
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Text(
                    notificationModel.time,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

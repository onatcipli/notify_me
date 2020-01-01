import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/pages/notification_stories.dart';

class NotificationDetailCard extends StatelessWidget {
  final NotificationModel notificationModel;

  final double height;

  const NotificationDetailCard(
      {Key key, this.notificationModel, this.height = 500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Card(
        color: Theme.of(context).primaryColorDark,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NotificationStories(
                        notifyCardModel: notificationModel,
                      );
                    },
                  ),
                );
              },
              child: CachedNetworkImage(
                height: height / 1.5,
                fit: BoxFit.fill,
                imageUrl: notificationModel.backgroundImageUrl,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              notificationModel.title.length > 15
                                  ? notificationModel.title.substring(0, 15) +
                                      '...'
                                  : notificationModel.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '~' + notificationModel.subTitle,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              notificationModel.time,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 64,
                              height: 64,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    notificationModel.profileImageUrl),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              notificationModel.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notificationModel.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark_border),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/pages/notification_stories.dart';
import 'package:notify_me/widgets/notification_cards/vote_part.dart';

class FavoriteNotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;

  final double width;

  final double height;

  const FavoriteNotificationCard(
      {Key key, this.notificationModel, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return NotificationStories(
            notifyCardModel: notificationModel,
          );
        }));
      },
      child: Container(
        width: width,
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      notificationModel.backgroundImageUrl,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            Theme.of(context).primaryColorDark,
                            Theme.of(context).primaryColorDark,
                            Color.fromARGB(88, 22, 28, 31),
                            Colors.transparent,
                          ],
                        )),
                    height: 200,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        notificationModel.time,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .primaryColorLight),
                                      )
                                    ],
                                  ),
                                  Text(
                                    notificationModel.title.length > 20
                                        ? notificationModel.title
                                                .substring(0, 20) +
                                            '...'
                                        : notificationModel.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '~' + notificationModel.subTitle,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      notificationModel.profileImageUrl),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          VotePart(size: 40,downColor: Colors.white70,textColor: Colors.white70,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

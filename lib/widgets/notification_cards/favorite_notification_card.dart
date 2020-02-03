import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/pages/notification_stories.dart';
import 'package:notify_me/widgets/notification_cards/vote_part.dart';

class FavoriteNotificationCard extends StatefulWidget {
  final NotificationModel notificationModel;

  final double width;

  final double height;

  const FavoriteNotificationCard(
      {Key key, this.notificationModel, this.width, this.height})
      : super(key: key);

  @override
  _FavoriteNotificationCardState createState() =>
      _FavoriteNotificationCardState();
}

class _FavoriteNotificationCardState extends State<FavoriteNotificationCard> {
  double swipePadding = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return NotificationStories(
            notifyCardModel: widget.notificationModel,
          );
        }));
      },
      onVerticalDragEnd: (event) {
        double x = event.velocity.pixelsPerSecond.direction;
        setState(() {
          if (x < 0) {
            swipePadding = 48;
          } else {
            swipePadding = 0;
          }
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: widget.width,
            height: widget.height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.refresh),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 100),
            bottom: swipePadding,
            child: Container(
              width: widget.width,
              height: widget.height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: widget.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.notificationModel.backgroundImageUrl,
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
                                  Theme.of(context)
                                      .primaryColorDark
                                      .withAlpha(88),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              widget.notificationModel.time,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .primaryColorLight),
                                            )
                                          ],
                                        ),
                                        Text(
                                          widget.notificationModel.title
                                                      .length >
                                                  20
                                              ? widget.notificationModel.title
                                                      .substring(0, 20) +
                                                  '...'
                                              : widget.notificationModel.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '~' +
                                              widget.notificationModel.subTitle,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 64,
                                      height: 64,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(widget
                                            .notificationModel.profileImageUrl),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                VotePart(
                                  size: 40,
                                  downColor: Colors.white70,
                                  textColor: Colors.white70,
                                  downOnTap: () {
                                    print("Badaaa");
                                  },
                                )
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
          ),
        ],
      ),
    );
  }
}

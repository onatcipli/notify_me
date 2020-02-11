import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/notification_cards/vote_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify_me/widgets/actionsheet_more.dart';
import 'package:notify_me/widgets/swipe_detector.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notificationModel;

  const NotificationCard({Key key, this.notificationModel}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  double right = 0;

  double left = 0;

  @override
  Widget build(BuildContext context) {
    final height = 115.0;
    return SwipeDetector(
      onSwipeLeft: () async {
        // TODO: change it with rightToLeftSwipe
        if (right == -100) {
          setState(() {
            right = 0;
          });
        } else if (right == 0) {
          setState(() {
            right = 100;
          });
        }
      },
      onSwipeRight: () {
        // TODO: change it with leftToRightSwipe
        if (right == 0) {
          setState(() {
            right = -100;
          });
        } else if (right == 100) {
          setState(() {
            right = 0;
          });
        } else if (right == 100) {
          setState(() {
            right = 200;
          });
        }
      },
      child: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              right: right,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: height,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    height: 32,
                                    width: 32,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(widget
                                          .notificationModel.profileImageUrl),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '~' + widget.notificationModel.subTitle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '@' + widget.notificationModel.name,
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
                                  widget.notificationModel.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: VotePart(
                                mainAxisSize: MainAxisSize.min,
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Container(
                              foregroundDecoration: BoxDecoration(
                                  gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: <Color>[
                                  Theme.of(context).primaryColorDark,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Theme.of(context).primaryColorDark,
                                ],
                              )),
                              child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width / 3,
                                height: height,
                                fit: BoxFit.fill,
                                imageUrl:
                                    widget.notificationModel.backgroundImageUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 2,
                            child: GestureDetector(
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.white70,
                              ),
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        ActionSheet());
                              },
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 0,
                            child: Text(
                              widget.notificationModel.time,
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

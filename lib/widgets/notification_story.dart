import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/pages/notify_detail_page.dart';

class NotificationStory extends StatelessWidget {
  const NotificationStory({
    Key key,
    @required this.notifyCardModel,
  }) : super(key: key);

  final NotificationModel notifyCardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return NotifyDetailPage();
                }));
              },
              child: Hero(
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height / 1.5,
                  fit: BoxFit.fill,
                  imageUrl: notifyCardModel.backgroundImageUrl,
                ),
                tag: notifyCardModel.id,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Container(),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Theme.of(context).primaryColorDark,
                    Colors.transparent,
                  ],
                )),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
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
                            notifyCardModel.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '~' + notifyCardModel.subTitle,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            notifyCardModel.time,
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: 64,
                            height: 64,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(notifyCardModel.profileImageUrl),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            notifyCardModel.name,
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
                    notifyCardModel.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
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
                contentOfTheNotification()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget contentOfTheNotification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StoryElement(),
        StoryElement(),
        StoryElement(),
      ],
    );
  }
}

class StoryElement extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final value = random.nextInt(800);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage("https://picsum.photos/id/${value}/500/500")),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}

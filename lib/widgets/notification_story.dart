import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/pages/notify_detail_page.dart';

class NotificationStory extends StatefulWidget {
  final NotificationModel notifyCardModel;

  NotificationStory({
    Key key,
    @required this.notifyCardModel,
  }) : super(key: key);

  @override
  _NotificationStoryState createState() => _NotificationStoryState();
}

class _NotificationStoryState extends State<NotificationStory>  with AfterLayoutMixin {
  final ScrollController _controller = ScrollController();

  double heightOfTheImage = 400;

  void handleHeight() {
    heightOfTheImage = MediaQuery.of(context).size.height / 1.8;
    _controller.addListener(() {
      if (_controller.offset > 75) {
        setState(() {
          heightOfTheImage = MediaQuery.of(context).size.height / 4;
        });
      }else {
        setState(() {
          heightOfTheImage = MediaQuery.of(context).size.height / 1.8;
        });
      }
    });
  }
  
  @override
  void afterFirstLayout(BuildContext context) {
    handleHeight();
  }

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
              child: AnimatedContainer(
                height: heightOfTheImage,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.notifyCardModel.backgroundImageUrl,
                  ),
                  tag: widget.notifyCardModel.id,
                ), duration: Duration(milliseconds: 400),
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
            controller: _controller,
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
                            widget.notifyCardModel.title,
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
                            '~' + widget.notifyCardModel.subTitle,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.notifyCardModel.time,
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
                              backgroundImage: NetworkImage(
                                  widget.notifyCardModel.profileImageUrl),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.notifyCardModel.name,
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
                    widget.notifyCardModel.description,
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
  final int value = 20;

  @override
  Widget build(BuildContext context) {
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

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context);
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/pages/notify_full_page.dart';
import 'package:notify_me/widgets/notify_favorite_card.dart';

class NotifyDetailCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  final double height;

  const NotifyDetailCard({Key key, this.notifyCardModel, this.height = 500}) : super(key: key);

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
                      return NotifyFullPage(
                        notifyCardModel: notifyCardModel,
                      );
                    },
                  ),
                );
              },
              child: CachedNetworkImage(
                height: height / 1.5,
                fit: BoxFit.fill,
                imageUrl: notifyCardModel.backgroundImageUrl,
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
                              notifyCardModel.title.length > 15
                                  ? notifyCardModel.title.substring(0, 15) + '...'
                                  : notifyCardModel.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
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
                                  color: Colors.white, fontWeight: FontWeight.bold),
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
                  Expanded(child: Container(),),
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

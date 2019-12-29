import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/pages/notify_detail_page.dart';


class NotifyDetailCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  const NotifyDetailCard({Key key, this.notifyCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
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
                child: CachedNetworkImage(
                  imageUrl: notifyCardModel.backgroundImageUrl,
                ),
              ),
            ],
          ),
          Column(
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
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '~' + notifyCardModel.subTitle,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
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
                    color: Colors.black.withOpacity(.8),
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
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

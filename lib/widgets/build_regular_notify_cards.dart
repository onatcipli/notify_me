import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';

class BuildRegularNotifyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return RegularNotifyCard(
              notifyCardModel: NotifyCardModel.fromJson(notifyJson));
        },
      ),
    );
  }
}

class RegularNotifyCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  const RegularNotifyCard({Key key, this.notifyCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6.2,
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: notifyCardModel.backgroundImageUrl,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            notifyCardModel.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Text('~' + notifyCardModel.subTitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Text(notifyCardModel.time),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 32,
                              height: 32,
                              child: CircleAvatar(
                                backgroundImage:
                                NetworkImage(notifyCardModel.profileImageUrl),
                              ),
                            ),
                            SizedBox(width: 8,),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

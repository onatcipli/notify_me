import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/pages/notify_full_page.dart';

class NotifyFavoriteCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  final double width;

  final double height;

  const NotifyFavoriteCard(
      {Key key, this.notifyCardModel, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return NotifyFullPage(
            notifyCardModel: notifyCardModel,
          );
        }));
      },
      child: Container(
        width: width,
        height: height,
        child: Card(
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                child: Hero(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: notifyCardModel.backgroundImageUrl,
                  ),
                  tag: notifyCardModel.id,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Theme.of(context).primaryColorDark,
                        Theme.of(context).primaryColorDark,
                        Colors.transparent,
                      ],
                    )),
                    height: 150,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    notifyCardModel.title.length > 20
                                        ? notifyCardModel.title
                                                .substring(0, 20) +
                                            '...'
                                        : notifyCardModel.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '~' + notifyCardModel.subTitle,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                  Text(
                                    notifyCardModel.time,
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      notifyCardModel.profileImageUrl),
                                ),
                              ),
                            ],
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
    );
  }
}

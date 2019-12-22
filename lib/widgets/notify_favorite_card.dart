import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';

const Color gradientBeginColor = Color(0xff222831);

class NotifyFavoriteCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  const NotifyFavoriteCard({Key key, this.notifyCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: notifyCardModel.backgroundImageUrl,
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
                    gradientBeginColor,
                    gradientBeginColor,
                    Colors.transparent
                  ],
                )),
                height: 150,
                width: 290,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        notifyCardModel.title,
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

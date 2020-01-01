import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/shared/notify_light_theme.dart';

class LinearGradientBackgroundImage extends StatelessWidget {
  final String imageUrl;

  final Color color;

  final double width;
  final double height;

  const LinearGradientBackgroundImage(
      {Key key,
      @required this.imageUrl,
      this.color = primaryColorDark,
      this.width = 500,
      this.height = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  color,
                  color,
                  Colors.transparent,
                ],
              ),
            ),
            height: height,
            width: width,
          ),
        ),
      ],
    );
  }
}

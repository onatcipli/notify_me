import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LinearGradientBackgroundImage extends StatelessWidget {
  final String imageUrl;

  final Color color;

  final double width;
  final double height;

  const LinearGradientBackgroundImage(
      {Key key,
      @required this.imageUrl,
      this.color = Colors.transparent,
      this.width = 500,
      this.height = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this.imageUrl == null
            ? Image.asset(
                'images/default-bg.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
              )
            : CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.fill,
                imageUrl: imageUrl,
              ),
        Positioned(
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0x26315F).withOpacity(0.8),
                  Color(0x26315F).withOpacity(0.5),
                  Color(0x26315F).withOpacity(0.2),
                  Colors.transparent
                ],
              ),
            ),
            height: height,
            width: width,
          ),
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
                  color,
                  color,
                  color.withOpacity(0.9),
                  color.withOpacity(0.8),
                  color.withOpacity(0.5),
                  color.withOpacity(0.2),
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

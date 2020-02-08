import 'package:flutter/material.dart';

class VotePart extends StatelessWidget {
  final Color upColor;
  final Color downColor;

  final double size;

  final Function upOnTap;
  final Function downOnTap;

  final Color textColor;

  final MainAxisSize mainAxisSize;

  const VotePart({
    Key key,
    this.upColor,
    this.downColor,
    this.size = 20,
    this.upOnTap,
    this.downOnTap,
    this.textColor,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: upOnTap,
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: upColor ?? Theme.of(context).accentColor,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.expand_less,
                color: Colors.white,
                size: size,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(
              "+121",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor ?? Colors.black54,
                fontSize: size / 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: downOnTap,
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: downColor ?? Colors.grey.withOpacity(.5),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.expand_more,
                color: Colors.white,
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SwipeDetector extends StatelessWidget {
  final Widget child;

  final Function bottomToTopSwipe;
  final Function topToBottomSwipe;

  const SwipeDetector(
      {Key key, this.child, this.bottomToTopSwipe, this.topToBottomSwipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onVerticalDragEnd: (event) {
        double x = event.velocity.pixelsPerSecond.direction;
        if (x < 0 && bottomToTopSwipe != null) {
          bottomToTopSwipe();
        } else if (x > 0 && topToBottomSwipe != null) {
          topToBottomSwipe();
        } else {
          print('swipe value : ' + x.toString());
        }
        print('swipe value : ' + x.toString());
      },
    );
  }
}

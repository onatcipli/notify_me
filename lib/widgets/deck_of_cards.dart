import 'package:flutter/material.dart';

class DeckOfCards extends StatefulWidget {
  final List<Widget> children;
  final int index;
  final int deckCount;

  final double speed;

  final size;

  const DeckOfCards({
    Key key,
    this.children,
    this.index,
    this.deckCount = 3,
    this.speed = 500, this.size = const Size(450,300),
  }) : super(key: key);

  @override
  _DeckOfCardsState createState() => _DeckOfCardsState();
}

class _DeckOfCardsState extends State<DeckOfCards>
    with TickerProviderStateMixin {
  double frontCardHeightPosition = (2 * 8).toDouble();
  AnimationController _controller;
  int index = 0;
  List subList = [];

  @override
  void initState() {
    initAnimations();
    modifySubList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        for (int i = 0; i < subList.length; i++)
          buildAsDeckView(subList.elementAt(i), i),
        _controller.status != AnimationStatus.forward
            ? SizedBox.expand(
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    if (frontCardHeightPosition < 17)
                      setState(() {
                        frontCardHeightPosition = frontCardHeightPosition +
                            widget.speed *
                                details.delta.dy /
                                MediaQuery.of(context).size.height;
                      });
                    print('frontCardheigh : ' +
                        frontCardHeightPosition.toString());
                  },
                  onPanEnd: (DragEndDetails details) {
                    if (frontCardHeightPosition.abs() > 70.0) {
                      animateCard();
                      print('frontCardheigh : ' +
                          frontCardHeightPosition.toString());
                      frontCardHeightPosition = (2 * 8).toDouble();
                    } else {
                      print('frontCardheigh : ' +
                          frontCardHeightPosition.toString());
                      frontCardHeightPosition = (2 * 8).toDouble();
                    }
                  },
                ),
              )
            : Container(),
      ],
    );
  }

  Widget buildAsDeckView(Widget child, int index) {
    if (widget.children.elementAt(index) == null) {
      return Container();
    }
    return Positioned(
      top: index == 2
          ? _controller.status == AnimationStatus.forward
              ? -CardsAnimation.frontCardDisappearAlignmentAnim(
                      _controller, frontCardHeightPosition)
                  .value
              : frontCardHeightPosition
          : (index * 8).toDouble(),
      child: Material(
        color: Colors.transparent,
        child: SizedBox.fromSize(
          size: Size(widget.size.height * getScale(index), widget.size.width),
          child: GestureDetector(
            onTap: () {
              animateCard();
            },
            onLongPress: () {
              setState(() {
                this.index--;
                modifySubList();
              });
            },
            child: child,
          ),
        ),
      ),
    );
  }

  void modifySubList() {
    final start = this.index;
    int end;
    if (widget.children.length >= this.index + widget.deckCount) {
      end = this.index + widget.deckCount;
    } else {
      end = widget.children.length;
    }
    subList = widget.children.sublist(start, end);
  }

  void resetIndex() {
    setState(() {
      index = 0;
    });
  }

  void animateCard() {
    this.index++;
    _controller.stop();
    _controller.value = 0.0;
    _controller.forward();
  }

  getScale(int index) {
    if (index == 0) {
      return 0.9;
    } else if (index == 1) {
      return 0.95;
    } else {
      return 1.0;
    }
  }

  void initAnimations() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        modifySubList();
      }
    });
  }
}

class CardsAnimation {
  static Animation frontCardDisappearAlignmentAnim(
      AnimationController parent, double beginHeight) {
    return Tween<double>(
      begin: beginHeight,
      end: 1000,
    ).animate(CurvedAnimation(
        parent: parent, curve: Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}

/*
              DeckOfCards(
                deckCount: 3,
                children: <Widget>[
                  Container(height: 200,width: 200,color: Colors.blue,),
                  Container(height: 200,width: 200,color: Colors.yellow,),
                  Container(height: 200,width: 200,color: Colors.green,),
                  Container(height: 200,width: 200,color: Colors.red,),
                  Container(height: 200,width: 200,color: Colors.orange,),
                  Container(height: 200,width: 200,color: Colors.black,),
                  Container(height: 200,width: 200,color: Colors.brown,),
                  Container(height: 200,width: 200,color: Colors.pink,),
                ],
              )
              * */

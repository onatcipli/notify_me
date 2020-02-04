import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetButton extends StatelessWidget {
  final String text;

  final Function onPressed;

  final Color color;

  const ActionSheetButton(
      {Key key, this.onPressed, this.color, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

class ActionSheet extends StatelessWidget {
  final Color backgroundColor;

  final List<ActionSheetButton> actionSheetButtons;

  const ActionSheet({
    Key key,
    @required this.actionSheetButtons,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius = 32;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //TODO: for later : Can we take these buttons as parameter like actionSheetButtons
              CupertinoActionSheetAction(
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.star_border),
                      label: Text('Favoriye ekle')),
                  onPressed: () {}),
              CupertinoActionSheetAction(
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.turned_in_not),
                      label: Text('Kaydet')),
                  onPressed: () {}),
              CupertinoActionSheetAction(
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.near_me),
                      label: Text('Paylaş')),
                  onPressed: () {}),
              CupertinoActionSheetAction(
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.sync),
                      label: Text('Tekrarla')),
                  onPressed: () {}),
              CupertinoActionSheetAction(
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.block),
                      label: Text('Şikayet Et')),
                  onPressed: () {}),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: const Text('Vazgeç'))
            ],
          ),
        ),
      ),
    );
  }
}

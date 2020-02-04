import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
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
                icon: Icon(Icons.share),
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
                
            onPressed: () {})
      ],
      
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Vazgeç')),
    );
  }
}

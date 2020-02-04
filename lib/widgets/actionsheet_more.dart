import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Favoriye Ekle'),
          onPressed: () {
          }),
        CupertinoActionSheetAction(
            child: const Text('Kaydet'),
          onPressed: () {
          }),
        CupertinoActionSheetAction(
            child: RichText(text: TextSpan(
              children: [
              WidgetSpan(child: Icon(Icons.share)),
              TextSpan(text: 'Paylaş')
            ]),),
          onPressed: () {
          }),
        CupertinoActionSheetAction(
            child: FlatButton.icon(onPressed: null, icon: Icon(Icons.refresh), label: Text('Tekrarla')) ,
          onPressed: () {
          }),
        CupertinoActionSheetAction(
            child: const Text('Şikayet Et'),
          onPressed: () {
          })
      ],
      cancelButton: CupertinoActionSheetAction(onPressed: () { Navigator.pop(context,'Cancel');}, child: const Text('Vazgeç')),
    );
  }

}

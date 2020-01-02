import 'dart:math';

import 'package:flutter/material.dart';

class CreateNotification extends StatefulWidget {
  @override
  _CreateNotificationState createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  double currentValue = 1;
  double maxValue = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColorLight),
          ),
          child: Text(
            "Create",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Card(
            //add photo
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(child: Image.network('https://picsum.photos/id/241/500/500',fit: BoxFit.fitWidth,)),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                      Icons.add_a_photo,
                      size: 60,
                      color: Colors.white,
                    ),)
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Text(currentValue.toInt().toString()),
                ),
                Expanded(
                  child: Slider(
                    onChanged: (double val) {
                      setState(() {
                        currentValue = val;
                      });
                    },
                    value: currentValue,
                    max: maxValue,
                    min: 0,
                    label: currentValue.toInt().toString(),
                    divisions: 20,
                    activeColor: Theme.of(context).primaryColorLight,
                  ),
                ),
                Text(maxValue.toInt().toString() + " km")
              ],
            ),
          ),
        ),
      ],
    );
  }
}

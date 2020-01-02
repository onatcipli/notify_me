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
        Card(),
        Padding(
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
                  min: 1,
                  label: "Distance",
                  divisions: 20,
                  activeColor: Theme.of(context).primaryColorLight,
                ),
              ),
              Text(maxValue.toInt().toString() + " km")
            ],
          ),
        ),
      ],
    );
  }
}

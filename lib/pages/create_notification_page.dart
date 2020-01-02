import 'package:flutter/material.dart';

class CreateNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Slider(
            value: 1.0,
            max: 100,
            min: 1,
          )
        ],
      ),
    );
  }
}
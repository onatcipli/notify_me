import 'package:flutter/material.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/widgets/linear_gradient_background_image.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userModel;

  const ProfilePage({Key key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearGradientBackgroundImage(
          imageUrl: userModel.backgroundImageUrl,
          color: Colors.white,
        ),
      ],
    );
  }
}

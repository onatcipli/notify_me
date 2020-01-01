import 'package:flutter/material.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/widgets/linear_gradient_background_image.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userModel;

  final double _bottom = 35;

  const ProfilePage({Key key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            LinearGradientBackgroundImage(
              imageUrl: userModel.backgroundImageUrl,
              color: Theme.of(context).primaryColor,
            ),
            Positioned(
              left: 15,
              bottom: _bottom,
              child: BuildUserInfo(size: size, userModel: userModel),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildUserInfo extends StatelessWidget {
  const BuildUserInfo({
    Key key,
    @required this.size,
    @required this.userModel,
  }) : super(key: key);

  final Size size;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: size.width / 3,
          width: size.width / 3,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userModel.profileImageUrl),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  userModel.name,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(Icons.map),
                  onPressed: () {},
                ),
              ],
            ),
            OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              highlightedBorderColor: Theme.of(context).accentColor,
              child: Text('follow'),
            )
          ],
        )
      ],
    );
  }
}

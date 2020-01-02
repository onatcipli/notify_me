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
        BuildProfileTabs(),
      ],
    );
  }
}

class BuildProfileTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(
                  text: 'Seçenekler',
                ),
                Tab(
                  text: 'Favorilerim',
                ),
                Tab(
                  text: 'Koleksiyon',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BuildOptionsTab(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildOptionsTab extends StatelessWidget {
  final List<String> categories = [
    'Futbol',
    'Yemek',
    'Okul',
    'Dizi',
    'Market',
  ];

  final List<String> channels = [
    'FenerBahçe',
    'Yemek',
    'Sağlık',
    'Dizi',
    'Dürüm',
    'Apple',
    'MACfit',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text('Categories'),
            children: <Widget>[
              Wrap(
                children: categories.map((String data) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Chip(
                      elevation: 2,
                      avatar: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        child: Text(data.substring(0, 1).toUpperCase()),
                      ),
                      label: Text(data),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ExpansionTile(
            title: Text('Channels'),
            children: <Widget>[
              Wrap(
                children: channels.map((String data) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Chip(
                      backgroundColor: Colors.transparent,
                      elevation: 5,
                      avatar: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        child: Text('#'),
                      ),
                      label: Text(data),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ExpansionTile(
            title: Text('Notifications'),
            children: <Widget>[
              Wrap(
                children: channels.map((String data) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Chip(
                      backgroundColor: Colors.transparent,
                      elevation: 5,
                      avatar: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        child: Text('#'),
                      ),
                      label: Text(data),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ],
      ),
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

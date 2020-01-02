import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notify_me/models/user_model.dart';
import 'package:notify_me/widgets/linear_gradient_background_image.dart';
import 'package:notify_me/widgets/search_bar.dart';

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
                  BuildFavoritesTab(),
                  BuildCollections(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCollections extends StatelessWidget {
  final List<Map<String, dynamic>> dynamicList = [
    {
      "image": "https://picsum.photos/id/823/500/500",
      "name": "Honda",
      "number": 26,
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "Çeşme",
      "number": 33,
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "No Sugar",
      "number": 42,
    },
    {
      "image": "https://picsum.photos/id/823/500/500",
      "name": "Honda",
      "number": 26,
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "Çeşme",
      "number": 33,
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "No Sugar",
      "number": 42,
    },
    {
      "image": "https://picsum.photos/id/823/500/500",
      "name": "Honda",
      "number": 26,
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "Çeşme",
      "number": 33,
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "No Sugar",
      "number": 42,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: dynamicList.map((current) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage(current['image'] as String),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      current['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      current['number'].toString() + ' more',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class BuildFavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BuildFavoritesInstance(),
          BuildFavoritesInstance(),
          BuildFavoritesInstance(),
        ],
      ),
    );
  }
}

class BuildFavoritesInstance extends StatelessWidget {
  final List<Map<String, dynamic>> dynamicList = [
    {
      "image": "https://picsum.photos/id/120/500/500",
      "name": "#Dürüm",
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "@Gezi",
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "@Yemek",
    },
    {
      "image": "https://picsum.photos/id/120/500/500",
      "name": "#Dürüm",
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "@Gezi",
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "@Yemek",
    },
    {
      "image": "https://picsum.photos/id/120/500/500",
      "name": "#Dürüm",
    },
    {
      "image": "https://picsum.photos/id/765/500/500",
      "name": "@Gezi",
    },
    {
      "image": "https://picsum.photos/id/352/500/500",
      "name": "@Yemek",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 75,
            child: SearchBar(
              backButton: false,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RotatedBox(
                    child: Text(
                      '~YEMEK',
                      style: TextStyle(color: Colors.black87),
                    ),
                    quarterTurns: -1,
                  ),
                ),
                for (var current in dynamicList)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(current['image'] as String),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(current['name'])
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/widgets/notify_favorite_card.dart';

class NotifyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: BuildCategories(
                categories: ['favorilerim', 'yemek'],
              ),
            ),
            Expanded(
              flex: 6,
              child: CarouselSlider(
                height: MediaQuery.of(context).size.height / 1.6,
                items: notifyListJson.map((myJson) {
                  NotifyCardModel current = NotifyCardModel.fromJson(myJson);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotifyDetailCard(
                      notifyCardModel: current,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotifyDetailCard extends StatelessWidget {
  final NotifyCardModel notifyCardModel;

  const NotifyDetailCard({Key key, this.notifyCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return NotifyDetailPage();
                  }));
                },
                child: CachedNetworkImage(
                  imageUrl: notifyCardModel.backgroundImageUrl,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          notifyCardModel.title.length > 15
                              ? notifyCardModel.title.substring(0, 15) + '...'
                              : notifyCardModel.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '~' + notifyCardModel.subTitle,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          notifyCardModel.time,
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 64,
                          height: 64,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(notifyCardModel.profileImageUrl),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          notifyCardModel.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  notifyCardModel.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildCategories extends StatelessWidget {
  final List<String> categories;

  const BuildCategories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          String currentCategory = categories.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  currentCategory,
                  style: TextStyle(
                    fontSize: index == 0 ? 20 : 18,
                    fontWeight: index == 0 ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1500 noti',
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Card(
            borderOnForeground: true,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(hintText: 'search '),
            ),
          ),
        ),
      ],
    );
  }
}

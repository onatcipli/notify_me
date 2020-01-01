import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notify_me/models/notify_card_model.dart';
import 'package:notify_me/widgets/build_categories.dart';
import 'package:notify_me/widgets/notification_model.dart';

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
              child: Align(
                alignment: Alignment.topCenter,
                child: CarouselSlider(
                  viewportFraction: 0.9,
                  height: MediaQuery.of(context).size.height / 1.5,
                  items: notifyListJson.map((myJson) {
                    NotificationModel current = NotificationModel.fromJson(myJson);
                    return NotifyDetailCard(
                      notifyCardModel: current,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
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

import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/build_categories.dart';
import 'package:notify_me/widgets/notification_cards/notification_detail_card.dart';
import 'package:notify_me/widgets/search_bar.dart';

class NotifyDetailPage extends StatelessWidget {
  final PageController controller = PageController();

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
              flex: 5,
              child: PageView.builder(
                controller: controller,
                itemCount: notifyListJson.length,
                itemBuilder: (BuildContext context, int position) {
                  final PageController verticalController = PageController();
                  return PageView.builder(
                    controller: verticalController,
                    scrollDirection: Axis.vertical,
                    itemCount: notifyListJson.length,
                    itemBuilder: (BuildContext context, int position) {
                      NotificationModel current = NotificationModel.fromJson(
                          notifyListJson.elementAt(position));
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NotificationDetailCard(
                          notificationModel: current,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            /*     Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.topCenter,
                child: CarouselSlider(
                  viewportFraction: 0.9,
                  height: MediaQuery.of(context).size.height / 1.4,
                  items: notifyListJson.map((myJson) {
                    NotificationModel current =
                        NotificationModel.fromJson(myJson);
                    return NotificationDetailCard(
                      notificationModel: current,
                    );
                  }).toList(),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/widgets/notification_story.dart';

class NotificationStories extends StatefulWidget {
  final NotificationModel notifyCardModel;

  const NotificationStories({
    Key key,
    this.notifyCardModel,
  }) : super(key: key);

  @override
  _NotificationStoriesState createState() => _NotificationStoriesState();
}

class _NotificationStoriesState extends State<NotificationStories> {

  final PageController controller = PageController();

  double currentPageValue = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColorDark,
      body: PageView.builder(
        controller: controller,
        itemCount: notifyListJson.length,
        itemBuilder: (BuildContext context, int position) {
          NotificationModel current =
          NotificationModel.fromJson(notifyListJson.elementAt(position));
          return slidePageAnimation1(position, current);
        },
      ),
    );
  }

  Widget slidePageAnimation1(int position, NotificationModel current) {
    if (position == currentPageValue.floor()) {
      return Transform(
        transform: Matrix4.identity()
          ..rotateX(currentPageValue - position),
        child: Center(
          child: NotificationStory(notifyCardModel: current),
        ),
      );
    } else if (position == currentPageValue.floor() + 1) {
      return Transform(
        transform: Matrix4.identity()
          ..rotateX(currentPageValue - position),
        child: Center(
          child: NotificationStory(notifyCardModel: current),
        ),
      );
    } else {
      return NotificationStory(notifyCardModel: current);
    }
  }

  Widget slidePageAnimation2(int position, NotificationModel current) {
    if (position == currentPageValue.floor()) {
      return Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.004)..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
        child: Center(
          child: NotificationStory(notifyCardModel: current),
        ),
      );
    } else if (position == currentPageValue.floor() + 1){
      return Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.004)..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
        child: Center(
          child: NotificationStory(notifyCardModel: current),
        ),
      );
    } else {
      return Center(
        child: NotificationStory(notifyCardModel: current),
      );
    }
  }
}

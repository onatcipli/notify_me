import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';

class CreateNotification extends StatelessWidget {
  final AbstractNotificationCardRepository notificationCardRepository =
      FirebaseNotificationRepository();

  final Authenticated state;

  final TextEditingController titleController = new TextEditingController();
  final TextEditingController subTitleController = new TextEditingController();

  NotificationModel notificationModel;

  CreateNotification({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Bildirim Oluştur",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Icon(Icons.edit)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: size.width / 3,
            child: Stack(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: CircleAvatar(
                                backgroundImage: state
                                            .currentUserModel.profileUrl ==
                                        null
                                    ? AssetImage('images/default-profile.png')
                                    : NetworkImage(
                                        "https://i.picsum.photos/id/718/200/300.jpg"),
                              ),
                            ),
                            Text(
                              state.currentUserModel.title.length > 10
                                  ? '@' +
                                      state.currentUserModel.title
                                          .substring(0, 10)
                                  : '@' + state.currentUserModel.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextField(
                                cursorColor: Colors.black,
                                controller: titleController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    isDense: true,
                                    hintText: "What's happening?",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    border: InputBorder.none),
                              ),
                              TextField(
                                maxLines: 3,
                                cursorColor: Colors.black,
                                controller: subTitleController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 7),
                                  hintText: "Give us same detail...",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.query_builder,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '0s',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  50.0,
                ),
              ),
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              onPressed: () async {
                if (titleController.text.isNotEmpty &&
                    subTitleController.text.isNotEmpty) {
                  notificationModel = NotificationModel(
                    content: [],
                    id: null,
                    ownerId: state.currentUserModel.id,
                    title: titleController.text,
                    subTitle: subTitleController.text,
                    profileImageUrl: state.currentUserModel.profileUrl,
                    time: DateTime.now(),
                  );
                  await notificationCardRepository.sendNotification(
                      notificationModel, state.currentUserModel.id);
                  titleController.clear();
                  subTitleController.clear();
                  getNotifications(context);
                  Navigator.pop(context);
                  // see yo later
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Please fill in the blanks'),
                      );
                    },
                  );
                }
              },
              child: Text(
                "Share",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getNotifications(BuildContext context) {
    BlocProvider.of<NotificationBloc>(context).add(
      GetNotifications(
        BlocProvider.of<AuthenticationBloc>(context)
            .authenticationRepository
            .currentUser
            .followings,
      ),
    );
  }
}

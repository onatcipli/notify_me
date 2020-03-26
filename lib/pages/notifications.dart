import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';

class CreateNotification extends StatefulWidget {
  @override
  _CreateNotificationState createState() => _CreateNotificationState();
}

final AbstractNotificationCardRepository notificationCardRepository =
    FirebaseNotificationRepository();

class _CreateNotificationState extends State<CreateNotification> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController subTitleController = new TextEditingController();

  NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: subTitleController,
              decoration: const InputDecoration(
                labelText: 'SubTitle',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              if (state is Authenticated) {
                return RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    if (titleController.text.isNotEmpty ||
                        subTitleController.text.isNotEmpty) {
                      notificationModel = NotificationModel(
                        content: [],
                        id: null,
                        ownerId: state.currentUserModel.id,
                        title: titleController.text,
                        subTitle: subTitleController.text,
                        profileImageUrl:
                            'https://i.picsum.photos/id/718/200/300.jpg',
                        time: DateTime.now(),
                      );
                      await notificationCardRepository.sendNotification(
                          notificationModel, state.currentUserModel.id);
                      titleController.clear();
                      subTitleController.clear();
                      getNotifications(context);
                      Navigator.pop(context);
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
                  child: const Text(
                    'Send Notification',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
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

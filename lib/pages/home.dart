import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/widgets/notification_card.dart';
import 'package:notify_me/widgets/search_bar.dart';

class Home extends StatelessWidget {
  static final AbstractNotificationCardRepository notificationCardRepository =
      FirebaseNotificationRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Authenticated) {
            return FloatingActionButton(
              onPressed: () async {
                //TODO: create bloc for sending notifications
                await notificationCardRepository.sendNotification(
                    NotificationModel.fromJson(myJson),
                    state.currentUserModel.id);
                getNotifications(context);
              },
              child: Icon(Icons.add),
            );
          } else {
            return Container();
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBar(
              onChanged: (String text) async {
                //TODO: implement here
              },
            ),
            Expanded(
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (BuildContext context, NotificationState state) {
                  if (state is AvailableNotifications) {
                    return RefreshIndicator(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: state.notifications.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NotificationCard(
                            notificationModel:
                                state.notifications.elementAt(index),
                          );
                        },
                      ),
                      onRefresh: () async {
                        getNotifications(context);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
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

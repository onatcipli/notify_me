import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/widgets/notification_card.dart';
import 'package:notify_me/widgets/search_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is Authenticated) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                FirebaseNotificationRepository()
                    .sendNotification(NotificationModel.fromJson(myJson));
              },
              child: Icon(Icons.add),
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  SearchBar(
                    onChanged: (String text) async {},
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: FirebaseNotificationRepository()
                          .getNotificationCards(
                              state.currentUserModel.followings),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<NotificationModel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NotificationCard(
                                notificationModel:
                                    snapshot.data.elementAt(index),
                              );
                            },
                          );
                        } else
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

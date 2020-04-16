import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/pages/notifications.dart';
import 'package:notify_me/pages/profile.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/widgets/notification_card.dart';
import 'package:notify_me/widgets/search_bar.dart';

class Home extends StatelessWidget {
  final Function directToProfileWithEditMode;

  static final AbstractNotificationCardRepository notificationCardRepository =
      FirebaseNotificationRepository();

  const Home({Key key, this.directToProfileWithEditMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Authenticated) {
            return FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColorLight,
              foregroundColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                if (state.currentUserModel.title == null){
                  directToProfileWithEditMode();
                } else
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Material(
                          child: Container(
                              width: size.width - 20,
                              height: size.height / 2 - size.height / 7,
                              color: Colors.white,
                              child: CreateNotification(state: state)),
                        ),
                      );
                    },
                  );
              },
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
            child: SearchBar(
              onChanged: (String text) async {
                BlocProvider.of<NotificationBloc>(context)
                    .add(SearchNotifications(text));
                //TODO: implement here
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (BuildContext context, NotificationState state) {
                if (state is AvailableNotifications) {
                  return RefreshIndicator(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(8,8,8,16),
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

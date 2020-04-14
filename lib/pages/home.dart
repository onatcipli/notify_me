import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/pages/notifications.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/widgets/notification_card.dart';
import 'package:notify_me/widgets/search_bar.dart';

import 'notifications.dart';

class Home extends StatefulWidget {
  static final AbstractNotificationCardRepository notificationCardRepository =
      FirebaseNotificationRepository();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseMessaging _firebaseMessaging;

  @override
  void initState() {
    _firebaseMessaging = FirebaseMessaging();
    handleFirebase();
    super.initState();
  }

  void handleFirebase() async {
    if (Platform.isIOS) {
      bool permission = await _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true),
      );
    }
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      //TODO: save the token to current user document in Firestore
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //handleOnLaunch
        _showItemDialog(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //handleOnResume
        _showItemDialog(message);
      },
    );
  }

  void _showItemDialog(Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(
        context,
        body: message['notification']['body'],
        title: message['notification']['title'],
      ),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        //_navigateToItemDetail(message);
      }
    });
  }

  Widget _buildDialog(
    BuildContext context, {
    @required String title,
    @required String body,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Authenticated) {
            return FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNotification()));
              },
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColorLight,
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
                      padding: EdgeInsets.all(8),
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

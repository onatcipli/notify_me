import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_event.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/pages/login.dart';
import 'package:notify_me/repositories/authentication_repository.dart';
import 'package:notify_me/repositories/notification_card_repository.dart';
import 'package:notify_me/shared/custom_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  AuthenticationBloc _authenticaitonBlock;
  @override
  Widget build(BuildContext context) {
    if (_authenticaitonBlock == null) {
      _authenticaitonBlock = AuthenticationBloc(
        LocalAuthenticationRepository(),
      );
    }
    return MultiBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "NotifyMe",
        theme: customTheme,
        home: Login(),
      ),
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              _authenticaitonBlock..add(AppStarted()),
        ),
        BlocProvider<NotificationBloc>(
          create: (BuildContext context) => NotificationBloc(
            FirebaseNotificationRepository(),
            _authenticaitonBlock,
          )..add(
              GetNotifications(
                BlocProvider.of<AuthenticationBloc>(context)
                    .authenticationRepository
                    .currentUser
                    .followings,
              ),
            ),
        ),
      ],
    );
  }
}

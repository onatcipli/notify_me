import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_event.dart';
import 'package:notify_me/pages/login.dart';
import 'package:notify_me/repositories/authentication_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "NotifyMe",
        home: Login(),
      ),
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            LocalAuthenticationRepository(),
          )..add(AppStarted()),
        ),
      ],
    );
  }
}

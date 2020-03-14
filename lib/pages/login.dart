import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_bloc.dart';
import 'package:notify_me/blocs/authentication/authentication_state.dart';
import 'package:notify_me/helper/navigator_helper.dart';
import 'package:notify_me/pages/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      child: Scaffold(
        body: Center(
          child: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ),
      ),
      listener: (BuildContext context, AuthenticationState state) {
        if (state is Authenticated) {
          NavigatorHelper.makeRootPage(context, Home());
        }
        //else if (state is UnAuthenticated) {
        //  NavigatorHelper.makeRootPage(context, Home());
        //}
      },
    );
  }
}
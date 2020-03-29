import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/pages/scan_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      if (state is Authenticated) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanQRCode()));
            },
            child: Icon(Icons.code),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  data: state.currentUserModel.id,
                  version: QrVersions.auto,
                  size: 200.0,
                  errorStateBuilder: (cxt, err) {
                    return Container(
                      child: Center(
                        child: Text(
                          "Unable to create QR Code is generated.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                state.currentUserModel.title == null ? Text("") : Text(state.currentUserModel.title)
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("Profile"),
          ),
        );
      }
    });
  }
}

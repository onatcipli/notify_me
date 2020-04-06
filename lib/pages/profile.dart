import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notify_me/blocs/authentication/bloc.dart';
import 'package:notify_me/blocs/notification/bloc.dart';
import 'package:notify_me/pages/scan_code.dart';
import 'package:notify_me/widgets/linear_gradient_background_image.dart';
import 'package:notify_me/widgets/notification_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  initState() {
    super.initState();
    getNotifications(context);
  }

  bool isEditMode = false;
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      if (state is Authenticated) {
        return Scaffold(
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            overlayColor: Colors.black,
            overlayOpacity: 0.3,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                  child: Icon(Icons.photo_camera),
                  labelWidget: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Scan QR",
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanQRCode()))),
              SpeedDialChild(
                child: Icon(Icons.code),
                labelWidget: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Show QR",
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      content: Container(
                        width: size.width / 2,
                        height: size.width / 2,
                        child: Center(
                          child: QrImage(
                            data: state.currentUserModel.id,
                            version: QrVersions.auto,
                            size: size.width / 2,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: Container(
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        LinearGradientBackgroundImage(
                          imageUrl: state.currentUserModel.backgroundUrl,
                          color: Colors.white,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            state.currentUserModel.followings.length
                                    .toString() +
                                " following..",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          bottom: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: size.width / 2.5,
                                width: size.width / 2.5,
                                child: Stack(
                                  children: <Widget>[
                                    backdropFilter(
                                        context,
                                        Container(
                                          height: size.width / 2.5,
                                          width: size.width / 2.5,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 2.0),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(
                                                    size.width / 5)),
                                            image: DecorationImage(
                                              image: state.currentUserModel
                                                          .profileUrl !=
                                                      null
                                                  ? NetworkImage(state
                                                      .currentUserModel
                                                      .profileUrl)
                                                  : AssetImage(
                                                      "images/default-profile.png"),
                                            ),
                                          ),
                                        )),
                                    if (isEditMode)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 62, 0, 0),
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50.0,
                                            ),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          onPressed: () {
                                            getImage();
                                          },
                                          child: Text(
                                            "Choose Image",
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              isEditMode
                                  ? Container(
                                      width: size.width / 4,
                                      child: TextField(
                                        cursorColor: Colors.red,
                                        controller: _titleController,
                                        decoration: const InputDecoration(
                                          labelText: 'Name',
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      state.currentUserModel.title == null
                                          ? "Name"
                                          : state.currentUserModel.title,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontStyle: FontStyle.italic),
                                    ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 350,
                          child: IconButton(
                            iconSize: 30,
                            icon: Icon(isEditMode ? Icons.check : Icons.edit),
                            color: Colors.white,
                            onPressed: () {
                              if (isEditMode &&
                                  state.currentUserModel.title !=
                                      _titleController.text &&
                                  _titleController.text.isNotEmpty) {
                                state.currentUserModel.title =
                                    _titleController.text;
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(UpdateUser(state.currentUserModel));
                              }
                              setState(() {
                                isEditMode = !isEditMode;
                                _titleController.text =
                                    state.currentUserModel.title;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<NotificationBloc, NotificationState>(
                    builder: (BuildContext context, NotificationState state) {
                      if (state is AvailableNotifications &&
                          state.currentUserNotifications != null) {
                        return RefreshIndicator(
                          child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: state.currentUserNotifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NotificationCard(
                                notificationModel: state
                                    .currentUserNotifications
                                    .elementAt(index),
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
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget backdropFilter(BuildContext context, Widget child) {
    return isEditMode
        ? Stack(
            fit: StackFit.expand,
            children: <Widget>[
              child,
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(90)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              )
            ],
          )
        : child;
  }

  void getNotifications(BuildContext context) {
    BlocProvider.of<NotificationBloc>(context).add(
      GetUserNotifications(
        BlocProvider.of<AuthenticationBloc>(context)
            .authenticationRepository
            .currentUser
            .id,
      ),
    );
  }
}

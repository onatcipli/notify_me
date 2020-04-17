import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:notify_me/models/notification_model.dart';
import 'package:http/http.dart' as http;

class CloudMessagingRepository {
  static final CloudMessagingRepository _singleton =
      CloudMessagingRepository._internal();

  FirebaseMessaging _firebaseMessaging;
  factory CloudMessagingRepository() => _singleton;

  CloudMessagingRepository._internal() {
    _firebaseMessaging = FirebaseMessaging();
    if (Platform.isIOS) {
      Future<bool> permission =
          _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true),
      );
      permission.then((val) => _registration());
    } else {
      _registration();
    }
  } // private constructor

  _registration() {
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      //TODO: save the token to current user document in Firestore
    });
  }

  FirebaseMessaging getMessaging() {
    return _firebaseMessaging;
  }

  addFollowing(followingId) {
    _firebaseMessaging.subscribeToTopic(followingId);
  }

  removeFollowing(followingId) {
    _firebaseMessaging.unsubscribeFromTopic(followingId);
  }

  Future<AccessCredentials> authanticate() async {
    var accountCredentials = new ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "notifyme-2c420",
      "private_key_id": "bc47c23ec72b770858f6d9b21fcf2531536c1826",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDQ3CYZIdMF97vv\nMJlTPlFHJk8uwauOGSKuc6iPaWtjj2rgQ9zIBBn51kyS+7enRx/pK7q01aPVcyWE\n4DZeRE2egxnrDh/PXMk53eUSm8jKhzSIKWZILj5DqwGKSybH7l+amLXGayDyRdxa\n5wxzLhiM5Ej+Z+Jch2Au1FlxUf3FJEZNmXEoO9TrbekouzuH2gn2ZYE8OTZE7K7e\ntlu3c+B5qJLyTzRCVHNaDzML2spwdskfdYMHub6isL1WmEXiqThKfljsd3aAcL6Y\nueeqoasfN3rbGDUnnKurxBsHybdMpuUTlx6470HD0G0hYDSGAryBRJdFqFywsiJ0\ngc7X4ZqLAgMBAAECggEAZSIUuJquSfd5YwrPU4Wbaa5dLTDOV1JIfty2RCsxutXZ\nVJrHr3p88YMZNRr6BN/lzcxE7gd8+4B0LHE9IkxEoXqt9Cm0sX4mWgTeRTJ1+cua\nXkxdoJnzwGRvrH1TXABK/trvOhLpsyas2r+CQcuSS7bGuZmn/FH4+vQME1k2Xlyf\nNUeMV/0vn1OhZbHrngGiOQBAhwIoGF6dbvaLWJ4ij+gEpXbm8VIrZljGkWTbI7B4\nFkCakuu/NZSSFCvVmnohH86CDt4611uUzvkTOE1d3T6qrg0nCOJFWwfJ2zjTTAMO\nmTSTmLM7aJMUCQu1tG7D8U3D/aTCosoWW4WeXiUiMQKBgQD/qv0qeDUmC4IIWKX1\n5ZbSqpKUUQryUBuftQ7Utz8hOd9Aldtbf/YFLUmXO1OaQSRVSYtsIiiLkPBimp5f\nNSEhlfZAxocY58FtraTrqsZYG7YFlTRfwmRGNa3r94M+v1L0835lyfZ511+cPmec\nlo+pgugmvHeZ1BQiur9z+rirLQKBgQDRIZiRfTUapX1aiLYWFlJASz1Ayi5SMtB2\nv0Qno4ku+kKESMXFwGAaPbYYrNPzNap7ZY0FbWXQVYAUMKBkDbWOzt2OzbL6RzRC\nha4UVa98jdn4cAR68n8HkP03m0PioIpvIYoGm+P7sxR5uqdqrZHzrT251oPl5IA9\nBbPiLsEPlwKBgDMI1MRXfnR7s5cq6uXs0HB48A1/J+o6p2j34WAAvC9LuA7SWxkm\nr9tUsO3pP8T43+HObnBFWUaSxglIx/hFSLnFj4RanLkR+gCEuvj3++O2lF0E7ZF3\n4kBJktAZdi9eTZbry/1RlUu4/DLaGiCdxUuW//RLhqxEM0jDclgaYiZ5AoGAHlWD\nLcc9hqnubs1ZrAZ807qWHem1olKgjjjcB+veoCPItitgFHj895Fv8lBPRf3IxrFK\nLTlbBUcBluwet6SNazNyS55mkYr2d5ewUl7DX4urzC9jVvoJlu1e7UvmIt8qdUgm\nHyNJhF7LX4TFd+HJQ9EjHOuSoivste031Fz3v+0CgYEA3niv79k6YP2CV+HClvwk\nlruEWOmwxwyobMyygvV/ElWdZjJ7QDs3EPoMZoYFfcwji/ydC1NEUYc7cRi4feJP\nXFfyB6SbuiCflqk70e2MGASqLqDfXf4gLlMIJQHp8mMKm7hNhptlqPzyHYfN/nsP\nW6Jld/38OycJ0VdZYvLDfGM=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-qw8ux@notifyme-2c420.iam.gserviceaccount.com",
      "client_id": "113093699715613460403",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-qw8ux%40notifyme-2c420.iam.gserviceaccount.com"
    });
    var scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    var client = new http.Client();
    AccessCredentials credentials =
        await obtainAccessCredentialsViaServiceAccount(
            accountCredentials, scopes, client);
    client.close();
    return credentials;
  }

  Future<bool> pushNotification({
    NotificationModel model,
    String ownerId,
    int cnt = 0,
  }) async {
    try {
      AccessCredentials credentials = await authanticate();
      print(credentials.accessToken.toString());
      http.Response response = await http.post(
        'https://fcm.googleapis.com/v1/projects/notifyme-2c420/messages:send',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              credentials.accessToken.type + ' ' + credentials.accessToken.data,
        },
        body: jsonEncode(
          {
            'validate_only': false,
            'message': {
              'notification': {
                'body': model.subTitle,
                'title': model.title,
                'image': model.profileImageUrl
              },
              'data': {
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'id': model.id,
                'owner': model.ownerId
              },
              'topic': ownerId,
            },
          },
        ),
      );
      String result = Utf8Decoder().convert(response.bodyBytes);
      print(result);
      if (response.statusCode < 300) {
        return true;
      }
      return false;
    } catch (err) {
      if (cnt < 3) {
        return await pushNotification(
          model: model,
          ownerId: ownerId,
          cnt: cnt++,
        );
      } else {
        return false;
      }
    }
  }
}

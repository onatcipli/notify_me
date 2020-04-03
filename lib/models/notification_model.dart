import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String id;
  String ownerId;
  String ownerTitle;
  String title;
  String subTitle;
  String profileImageUrl;
  DateTime time;
  List<Content> content;

  NotificationModel({
    this.id,
    this.ownerId,
    this.ownerTitle,
    this.title,
    this.subTitle,
    this.profileImageUrl,
    this.time,
    this.content,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        ownerId: json["ownerId"],
        ownerTitle: json["ownerTitle"] ?? 'no-title',
        title: json["title"],
        subTitle: json["subTitle"],
        profileImageUrl: json["profileImageUrl"],
        time: json["time"],
        content: json["content"] == null
            ? []
            : List<Content>.from(
                json["content"].map((x) => Content.fromJson(x))),
      );

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationModel(
        id: snapshot.data["id"] ?? snapshot.documentID,
        ownerId: snapshot.data["ownerId"],
        ownerTitle: snapshot.data["ownerTitle"] ?? 'no-title',
        title: snapshot.data["title"],
        subTitle: snapshot.data["subTitle"],
        profileImageUrl: snapshot.data["profileImageUrl"],
        time: (snapshot.data["time"] as Timestamp).toDate(),
        content: snapshot.data["content"] == null
            ? []
            : List<Content>.from(
                snapshot.data["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ownerId": ownerId,
        "ownerTitle": ownerTitle ?? 'no-title',
        "title": title,
        "subTitle": subTitle,
        "profileImageUrl": profileImageUrl,
        "time": time,
        "content": content == null
            ? []
            : List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  String type;
  String value;

  Content({
    this.type,
    this.value,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["type"],
        value: json["value"],
      );

  factory Content.fromSnapshot(DocumentSnapshot snapshot) => Content(
        type: snapshot.data["type"],
        value: snapshot.data["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

final myJson = {
  "id": null,
  "ownerId": "NTobBLj8BiIusEzkja3y",
  "title": "ilk notification",
  "subTitle":
      "Merhaba arkadaşlar bugün sizlere ilk notificationuumuzuuuu atiyorum, iyi akşamlar.",
  "profileImageUrl": 'https://i.picsum.photos/id/718/200/300.jpg',
  "time": DateTime.now(),
  "content": []
};

// To parse this JSON data, do
//
//     final notiCardModel = notiCardModelFromJson(jsonString);

import 'dart:convert';

NotifyCardModel notifyCardModelFromJson(String str) => NotifyCardModel.fromJson(json.decode(str));

String notifyCardModelToJson(NotifyCardModel data) => json.encode(data.toJson());

class NotifyCardModel {
  int id;
  String title;
  String description;
  String name;
  String profileImageUrl;
  String backgroundImageUrl;
  String subTitle;
  String time;
  List<String> attachments;

  NotifyCardModel({
    this.id,
    this.title,
    this.description,
    this.name,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.subTitle,
    this.time,
    this.attachments,
  });

  factory NotifyCardModel.fromJson(Map<String, dynamic> json) => NotifyCardModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    name: json["name"],
    profileImageUrl: json["profileImageUrl"],
    backgroundImageUrl: json["backgroundImageUrl"],
    subTitle: json["subTitle"],
    time: json["time"],
    attachments: List<String>.from(json["attachments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "name": name,
    "profileImageUrl": profileImageUrl,
    "backgroundImageUrl": backgroundImageUrl,
    "subTitle": subTitle,
    "time": time,
    "attachments": List<dynamic>.from(attachments.map((x) => x)),
  };
}

const notifyJson = {
  "id": 100,
  "title": "Menümüze yeni üye",
  "description": "description description",
  "name": "Ali Usta",
  "profileImageUrl": "https://picsum.photos/id/241/500/500",
  "backgroundImageUrl": "https://picsum.photos/id/200/500/500",
  "subTitle": "yemek",
  "time": "12m",
  "attachments": ["https://picsum.photos/id/241/500/500"]
};

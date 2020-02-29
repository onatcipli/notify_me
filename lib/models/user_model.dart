import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String title;
  String profileUrl;
  String backgroundUrl;
  int followerCount;
  List<String> followings;

  UserModel({
    this.id,
    this.title,
    this.profileUrl,
    this.backgroundUrl,
    this.followerCount,
    this.followings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        title: json["title"],
        profileUrl: json["profileUrl"],
        backgroundUrl: json["backgroundUrl"],
        followerCount: json["followerCount"],
        followings: List<String>.from(json["followings"].map((x) => x)),
      );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) => UserModel(
        id: snapshot.data["id"] ?? snapshot.documentID,
        title: snapshot.data["title"],
        profileUrl: snapshot.data["profileUrl"],
        backgroundUrl: snapshot.data["backgroundUrl"],
        followerCount: snapshot.data["followerCount"],
        followings: snapshot.data["followings"] == null
            ? null
            : List<String>.from(snapshot.data["followings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "profileUrl": profileUrl,
        "backgroundUrl": backgroundUrl,
        "followerCount": followerCount,
        "followings": followings == null
            ? null
            : List<dynamic>.from(followings.map((x) => x)),
      };
}

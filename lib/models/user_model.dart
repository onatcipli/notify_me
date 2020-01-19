// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String description;
  String name;
  String profileImageUrl;
  String backgroundImageUrl;
  int followerCount;

  UserModel({
    this.id,
    this.description,
    this.name,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.followerCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        description: json["description"],
        name: json["name"],
        profileImageUrl: json["profileImageUrl"],
        backgroundImageUrl: json["backgroundImageUrl"],
        followerCount: json["followerCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "name": name,
        "profileImageUrl": profileImageUrl,
        "backgroundImageUrl": backgroundImageUrl,
        "followerCount": followerCount,
      };
}

const userJson = {
  "id": 1001,
  "description": "description description",
  "name": "Remzinin Yeri",
  "profileImageUrl": "https://picsum.photos/id/241/500/500",
  "backgroundImageUrl": "https://picsum.photos/id/200/500/500",
  "followerCount": 1324
};

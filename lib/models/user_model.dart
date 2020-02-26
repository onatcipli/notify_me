
import 'dart:convert';

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

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "profileUrl": profileUrl,
        "backgroundUrl": backgroundUrl,
        "followerCount": followerCount,
        "followings": List<dynamic>.from(followings.map((x) => x)),
    };
}

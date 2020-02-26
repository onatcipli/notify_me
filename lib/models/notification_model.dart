
import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    String id;
    String ownerId;
    String title;
    String profileImageUrl;
    String time;
    List<Content> content;

    NotificationModel({
        this.id,
        this.ownerId,
        this.title,
        this.profileImageUrl,
        this.time,
        this.content,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        ownerId: json["ownerId"],
        title: json["title"],
        profileImageUrl: json["profileImageUrl"],
        time: json["time"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ownerId": ownerId,
        "title": title,
        "profileImageUrl": profileImageUrl,
        "time": time,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
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

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
    };
}

// To parse this JSON data, do
//
//     final notiCardModel = notiCardModelFromJson(jsonString);

import 'dart:convert';

NotifyCardModel notifyCardModelFromJson(String str) =>
    NotifyCardModel.fromJson(json.decode(str));

String notifyCardModelToJson(NotifyCardModel data) =>
    json.encode(data.toJson());

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

  factory NotifyCardModel.fromJson(Map<String, dynamic> json) =>
      NotifyCardModel(
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

const List<Map<String, dynamic>> notifyListJson = [
  {
    "id": 100,
    "title": "Menümüze yeni üye",
    "description":
        "Denemeniz için kısa bir süreliğine yarısı bizden yarısı sizden !",
    "name": "Ali Usta",
    "profileImageUrl": "https://picsum.photos/id/241/500/500",
    "backgroundImageUrl": "https://picsum.photos/id/200/500/500",
    "subTitle": "yemek",
    "time": "12m",
    "attachments": ["https://picsum.photos/id/241/500/500"]
  },
  {
    "id": 101,
    "title": "İzmire kargo başladı!",
    "description":
        "Antep baharatlarımızı denemeniz için kısa bir süreliğine kargo  bizden !",
    "name": "Antep Baharat",
    "profileImageUrl":
        "http://www.antepmahsulleri.com/Uploads/UrunResimleri/baharat-cesitleri-ipek-kirmizi-pul-biber-0292.jpg",
    "backgroundImageUrl":
        "https://www.gaziantep.com/imgs/700x420x1/2018-11/gaziantepden.png",
    "subTitle": "Alışveriş",
    "time": "1h",
    "attachments": [
      "https://st2.depositphotos.com/1011517/12138/i/950/depositphotos_121389612-stock-photo-seasoning-pistachio-and-corn.jpg"
    ]
  },
  {
    "id": 102,
    "title": "Sınav sonuçları açıklandı!",
    "description":
        "Game Design 3. sınıf bütünleme sonuçları açıklandı gençler.",
    "name": "Gamer Batu",
    "profileImageUrl": "https://i.ytimg.com/vi/toqdP0FUjC0/maxresdefault.jpg",
    "backgroundImageUrl":
        "https://image.shutterstock.com/image-illustration/exam-results-red-rubber-stamp-600w-204939817.jpg",
    "subTitle": "Okul",
    "time": "10s",
    "attachments": [""]
  },
  {
    "id": 103,
    "title": "Sıcak şarap günü olsun bugün!",
    "description":
        "Sıcak şarapla yılın en soğuk gününü hep birlikte sıcacık geçirelim. Sıcak şarap %40 indirimli..",
    "name": "İstifçi",
    "profileImageUrl":
        "https://scontent-yyz1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/72317743_467714850543102_7363417868815566902_n.jpg?_nc_ht=scontent-yyz1-1.cdninstagram.com&_nc_cat=106&oh=598ec0e10e1bec3562bc325ccbf95d1a&oe=5E710752",
    "backgroundImageUrl":
        "https://www.manfect.com/wp-content/uploads/sicak-sarap-tarifi-kirmizi-min-1050x700.jpg ",
    "subTitle": "Mekan",
    "time": "30m",
    "attachments": [""]
  },
  {
    "id": 104,
    "title": "Derbi başlıyoooor!",
    "description":
        "GS - BJK karşılaşmaya sayılı dakikalar kala ilk 11 açıklandı. Link ekte!",
    "name": "Galatasaray",
    "profileImageUrl":
        "https://picsum.photos/id/216/500/500",
    "backgroundImageUrl":
        "https://picsum.photos/id/215/500/500",
    "subTitle": "Galatasaray SK",
    "time": "3m",
    "attachments": [
      "https://iasbh.tmgrup.com.tr/b99327/752/395/0/143/2048/1220?u=https://isbh.tmgrup.com.tr/sbh/2019/12/21/1576922219450.jpg"
    ]
  }
];

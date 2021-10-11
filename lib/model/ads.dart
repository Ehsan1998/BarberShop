// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  Ads({
    this.data!,
  });

  List<Datum> data;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.image,
  });

  String name;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

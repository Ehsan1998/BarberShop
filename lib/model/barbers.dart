// To parse this JSON data, do
//
//     final barbers = barbersFromJson(jsonString);

import 'dart:convert';

Barbers barbersFromJson(String str) => Barbers.fromJson(json.decode(str));

String barbersToJson(Barbers data) => json.encode(data.toJson());

class Barbers {
  Barbers({
    this.data,
  });

  List<Datum> data;

  factory Barbers.fromJson(Map<String, dynamic> json) => Barbers(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.nameShop,
    this.phone,
    this.address,
    this.timeWorkStart,
    this.timeWorkEnd,
    this.imageBusinessLicense,
    this.imageHairdressingDegree,
    this.latitude,
    this.longitude,
    this.user,
  });

  String nameShop;
  String phone;
  String address;
  String timeWorkStart;
  String timeWorkEnd;
  String imageBusinessLicense;
  String imageHairdressingDegree;
  double latitude;
  double longitude;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nameShop: json["name_shop"],
        phone: json["phone"],
        address: json["address"],
        timeWorkStart: json["time_work_start"],
        timeWorkEnd: json["time_work_end"],
        imageBusinessLicense: json["image_business_license"],
        imageHairdressingDegree: json["image_hairdressing_degree"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "name_shop": nameShop,
        "phone": phone,
        "address": address,
        "time_work_start": timeWorkStart,
        "time_work_end": timeWorkEnd,
        "image_business_license": imageBusinessLicense,
        "image_hairdressing_degree": imageHairdressingDegree,
        "latitude": latitude,
        "longitude": longitude,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic firstName;
  dynamic lastName;
  String phone;
  Image image;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        image: imageValues.map[json["image"]],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "image": imageValues.reverse[image],
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Image { STORAGE }

final imageValues = EnumValues({"/storage/": Image.STORAGE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

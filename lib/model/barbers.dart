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
      };
}

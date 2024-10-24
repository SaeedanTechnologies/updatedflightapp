// To parse this JSON data, do
//
//     final getAirports = getAirportsFromJson(jsonString);

import 'dart:convert';

GetAirports getAirportsFromJson(String str) =>
    GetAirports.fromJson(json.decode(str));

String getAirportsToJson(GetAirports data) => json.encode(data.toJson());

class GetAirports {
  bool status;
  List<Datum> data;

  GetAirports({
    required this.status,
    required this.data,
  });

  factory GetAirports.fromJson(Map<String, dynamic> json) => GetAirports(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String title;

  Datum({
    required this.id,
    required this.title,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

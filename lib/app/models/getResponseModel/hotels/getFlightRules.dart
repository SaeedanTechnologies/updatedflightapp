// To parse this JSON data, do
//
//     final getRulesModel = getRulesModelFromJson(jsonString);

import 'dart:convert';

GetRulesModel getRulesModelFromJson(String str) => GetRulesModel.fromJson(json.decode(str));

String getRulesModelToJson(GetRulesModel data) => json.encode(data.toJson());

class GetRulesModel {
    final Data data;

    GetRulesModel({
        required this.data,
    });

    factory GetRulesModel.fromJson(Map<String, dynamic> json) => GetRulesModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final ServiceInfo serviceInfo;

    Data({
        required this.serviceInfo,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        serviceInfo: ServiceInfo.fromJson(json["serviceInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "serviceInfo": serviceInfo.toJson(),
    };
}

class ServiceInfo {
    final List<FareRule> fareRules;

    ServiceInfo({
        required this.fareRules,
    });

    factory ServiceInfo.fromJson(Map<String, dynamic> json) => ServiceInfo(
        fareRules: List<FareRule>.from(json["fareRules"].map((x) => FareRule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fareRules": List<dynamic>.from(fareRules.map((x) => x.toJson())),
    };
}

class FareRule {
    final Group group;
    final List<Detail> details;

    FareRule({
        required this.group,
        required this.details,
    });

    factory FareRule.fromJson(Map<String, dynamic> json) => FareRule(
        group: Group.fromJson(json["group"]),
        details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "group": group.toJson(),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
    };
}

class Detail {
    final String title;
    final String text;

    Detail({
        required this.title,
        required this.text,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        title: json["title"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
    };
}

class Group {
    final String airline;
    final String cities;

    Group({
        required this.airline,
        required this.cities,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        airline: json["airline"],
        cities: json["cities"],
    );

    Map<String, dynamic> toJson() => {
        "airline": airline,
        "cities": cities,
    };
}

// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
    final bool? status;
    final String? token;
    final UserInfo? userInfo;
    final int? userCredit;
    final int? buyerId;
    final int? isCompany;
    final List<dynamic>? companyInfo;

    RegisterUserModel({
        this.status,
        this.token,
        this.userInfo,
        this.userCredit,
        this.buyerId,
        this.isCompany,
        this.companyInfo,
    });

    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
        status: json["status"],
        token: json["token"],
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        userCredit: json["user_credit"],
        buyerId: json["buyer_id"],
        isCompany: json["is_company"],
        companyInfo: json["company_info"] == null ? [] : List<dynamic>.from(json["company_info"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "user_info": userInfo?.toJson(),
        "user_credit": userCredit,
        "buyer_id": buyerId,
        "is_company": isCompany,
        "company_info": companyInfo == null ? [] : List<dynamic>.from(companyInfo!.map((x) => x)),
    };
}

class UserInfo {
    final Address? firstname;
    final Address? lastname;
    final Address? photo;
    final Address? companyName;
    final Address? address;

    UserInfo({
        this.firstname,
        this.lastname,
        this.photo,
        this.companyName,
        this.address,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        firstname: json["firstname"] == null ? null : Address.fromJson(json["firstname"]),
        lastname: json["lastname"] == null ? null : Address.fromJson(json["lastname"]),
        photo: json["photo"] == null ? null : Address.fromJson(json["photo"]),
        companyName: json["company-name"] == null ? null : Address.fromJson(json["company-name"]),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname?.toJson(),
        "lastname": lastname?.toJson(),
        "photo": photo?.toJson(),
        "company-name": companyName?.toJson(),
        "address": address?.toJson(),
    };
}

class Address {
    final String? name;
    final String? type;
    final String? value;

    Address({
        this.name,
        this.type,
        this.value,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "value": value,
    };
}

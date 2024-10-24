// To parse this JSON data, do
//
//     final requestUserRegister = requestUserRegisterFromJson(jsonString);

import 'dart:convert';

RequestUserRegister requestUserRegisterFromJson(String str) => RequestUserRegister.fromJson(json.decode(str));

String requestUserRegisterToJson(RequestUserRegister data) => json.encode(data.toJson());

class RequestUserRegister {
    final String? email;
    final String? password;
    final String? userInfoFirstname;
    final String? userInfoLastname;
    final String? city;
    final String? mobile;
    final String?address;
    final String? code_meli;
    final String? personalPhoto;

    RequestUserRegister({
        this.email,
        this.password,
        this.userInfoFirstname,
        this.userInfoLastname,
        this.city,
        this.mobile,
        this.address,
        this.code_meli,
        this.personalPhoto,
    });

    factory RequestUserRegister.fromJson(Map<String, dynamic> json) => RequestUserRegister(
        email: json["email"],
        password: json["password"],
        userInfoFirstname: json["user_info[firstname]"],
        userInfoLastname: json["user_info[lastname]"],
        city: json["city"],
        mobile: json["mobile"],
        address:json['address'],
        code_meli:json['code-meli'],
        personalPhoto:json['personal photo'],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "user_info[firstname]": userInfoFirstname,
        "user_info[lastname]": userInfoLastname,
        "city": city,
        "mobile": mobile,
        "address":address,
        'code-meli':code_meli,
        'personal photo':personalPhoto
        
     
    };
}

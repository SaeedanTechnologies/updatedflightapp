// To parse this JSON data, do
//
//     final getUserInformation = getUserInformationFromJson(jsonString);

import 'dart:convert';

GetUserInformation getUserInformationFromJson(String str) => GetUserInformation.fromJson(json.decode(str));

String getUserInformationToJson(GetUserInformation data) => json.encode(data.toJson());

class GetUserInformation {
    final bool? status;
    final String? token;
    final UserInfo? userInfo;
    final List<UserWallet>? userWallets;
    final int? buyerId;
    final int? isCompany;
    final List<dynamic>? companyInfo;
    final int? buyerGroupId;
    final String? email;
    final String? mobile;

    GetUserInformation({
        this.status,
        this.token,
        this.userInfo,
        this.userWallets,
        this.buyerId,
        this.isCompany,
        this.companyInfo,
        this.buyerGroupId,
        this.email,
        this.mobile,
    });

    factory GetUserInformation.fromJson(Map<String, dynamic> json) => GetUserInformation(
        status: json["status"],
        token: json["token"],
        userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
        userWallets: json["userWallets"] == null ? [] : List<UserWallet>.from(json["userWallets"]!.map((x) => UserWallet.fromJson(x))),
        buyerId: json["buyer_id"],
        isCompany: json["is_company"],
        companyInfo: json["company_info"] == null ? [] : List<dynamic>.from(json["company_info"]!.map((x) => x)),
        buyerGroupId: json["buyer_group_id"],
        email: json["email"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "user_info": userInfo?.toJson(),
        "userWallets": userWallets == null ? [] : List<dynamic>.from(userWallets!.map((x) => x.toJson())),
        "buyer_id": buyerId,
        "is_company": isCompany,
        "company_info": companyInfo == null ? [] : List<dynamic>.from(companyInfo!.map((x) => x)),
        "buyer_group_id": buyerGroupId,
        "email": email,
        "mobile": mobile,
    };
}

class UserInfo {
    final Firstname? firstname;
    final Firstname? lastname;
    final Firstname? photo;
    final Firstname? licenceAgent;

    UserInfo({
        this.firstname,
        this.lastname,
        this.photo,
        this.licenceAgent,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        firstname: json["firstname"] == null ? null : Firstname.fromJson(json["firstname"]),
        lastname: json["lastname"] == null ? null : Firstname.fromJson(json["lastname"]),
        photo: json["photo"] == null ? null : Firstname.fromJson(json["photo"]),
        licenceAgent: json["licence-agent"] == null ? null : Firstname.fromJson(json["licence-agent"]),
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname?.toJson(),
        "lastname": lastname?.toJson(),
        "photo": photo?.toJson(),
        "licence-agent": licenceAgent?.toJson(),
    };
}

class Firstname {
    final String? name;
    final String? type;
    final String? value;

    Firstname({
        this.name,
        this.type,
        this.value,
    });

    factory Firstname.fromJson(Map<String, dynamic> json) => Firstname(
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

class UserWallet {
    final int? credit;
    final String? alias;
    final BuyerCurrency? buyerCurrency;
    final String? buyerReferenceId;

    UserWallet({
        this.credit,
        this.alias,
        this.buyerCurrency,
        this.buyerReferenceId,
    });

    factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
        credit: json["credit"],
        alias: json["alias"],
        buyerCurrency: json["buyerCurrency"] == null ? null : BuyerCurrency.fromJson(json["buyerCurrency"]),
        buyerReferenceId: json["buyerReferenceId"],
    );

    Map<String, dynamic> toJson() => {
        "credit": credit,
        "alias": alias,
        "buyerCurrency": buyerCurrency?.toJson(),
        "buyerReferenceId": buyerReferenceId,
    };
}

class BuyerCurrency {
    final int? id;
    final String? title;
    final String? abb;
    final String? symbol;
    final int? decimalPlaces;

    BuyerCurrency({
        this.id,
        this.title,
        this.abb,
        this.symbol,
        this.decimalPlaces,
    });

    factory BuyerCurrency.fromJson(Map<String, dynamic> json) => BuyerCurrency(
        id: json["id"],
        title: json["title"],
        abb: json["abb"],
        symbol: json["symbol"],
        decimalPlaces: json["decimal_places"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "abb": abb,
        "symbol": symbol,
        "decimal_places": decimalPlaces,
    };
}

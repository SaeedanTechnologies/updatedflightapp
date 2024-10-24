// To parse this JSON data, do
//
//     final sendGuestInfo = sendGuestInfoFromJson(jsonString);

import 'dart:convert';

SendGuestInfo sendGuestInfoFromJson(String str) => SendGuestInfo.fromJson(json.decode(str));

String sendGuestInfoToJson(SendGuestInfo data) => json.encode(data.toJson());

class SendGuestInfo {
    final String? referenceId;
    final String? rooms0Adult0Title;
    final String? rooms0Adult0FirstName;
    final String? rooms0Adult0LastName;
    final String? rooms0Adult0Age;
    final String? rooms0Adult1Title;
    final String? rooms0Adult1FirstName;
    final String? rooms0Adult1LastName;
    final String? rooms0Adult1Age;
    final String? rooms0Child0Title;
    final String? rooms0Child0FirstName;
    final String? rooms0Child0LastName;
    final String? rooms0Child0Age;

    SendGuestInfo({
        this.referenceId,
        this.rooms0Adult0Title,
        this.rooms0Adult0FirstName,
        this.rooms0Adult0LastName,
        this.rooms0Adult0Age,
        this.rooms0Adult1Title,
        this.rooms0Adult1FirstName,
        this.rooms0Adult1LastName,
        this.rooms0Adult1Age,
        this.rooms0Child0Title,
        this.rooms0Child0FirstName,
        this.rooms0Child0LastName,
        this.rooms0Child0Age,
    });

    factory SendGuestInfo.fromJson(Map<String, dynamic> json) => SendGuestInfo(
        referenceId: json["referenceId"],
        rooms0Adult0Title: json["rooms[0][adult][0][Title]"],
        rooms0Adult0FirstName: json["rooms[0][adult][0][First Name]"],
        rooms0Adult0LastName: json["rooms[0][adult][0][Last Name]"],
        rooms0Adult0Age: json["rooms[0][adult][0][Age]"],
        rooms0Adult1Title: json["rooms[0][adult][1][Title]"],
        rooms0Adult1FirstName: json["rooms[0][adult][1][First Name]"],
        rooms0Adult1LastName: json["rooms[0][adult][1][Last Name]"],
        rooms0Adult1Age: json["rooms[0][adult][1][Age]"],
        rooms0Child0Title: json["rooms[0][child][0][Title]"],
        rooms0Child0FirstName: json["rooms[0][child][0][First Name]"],
        rooms0Child0LastName: json["rooms[0][child][0][Last Name]"],
        rooms0Child0Age: json["rooms[0][child][0][Age]"],
    );

    Map<String, dynamic> toJson() => {
        "referenceId": referenceId,
        "rooms[0][adult][0][Title]": rooms0Adult0Title,
        "rooms[0][adult][0][First Name]": rooms0Adult0FirstName,
        "rooms[0][adult][0][Last Name]": rooms0Adult0LastName,
        "rooms[0][adult][0][Age]": rooms0Adult0Age,
        "rooms[0][adult][1][Title]": rooms0Adult1Title,
        "rooms[0][adult][1][First Name]": rooms0Adult1FirstName,
        "rooms[0][adult][1][Last Name]": rooms0Adult1LastName,
        "rooms[0][adult][1][Age]": rooms0Adult1Age,
        "rooms[0][child][0][Title]": rooms0Child0Title,
        "rooms[0][child][0][First Name]": rooms0Child0FirstName,
        "rooms[0][child][0][Last Name]": rooms0Child0LastName,
        "rooms[0][child][0][Age]": rooms0Child0Age,
    };
}

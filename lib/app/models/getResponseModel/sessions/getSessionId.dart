// To parse this JSON data, do
//
//     final getSessionId = getSessionIdFromJson(jsonString);

import 'dart:convert';

GetSessionId getSessionIdFromJson(String str) => GetSessionId.fromJson(json.decode(str));

String getSessionIdToJson(GetSessionId data) => json.encode(data.toJson());

class GetSessionId {
    final bool? status;
    final String? sessionId;

    GetSessionId({
        this.status,
        this.sessionId,
    });

    factory GetSessionId.fromJson(Map<String, dynamic> json) => GetSessionId(
        status: json["status"],
        sessionId: json["sessionId"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "sessionId": sessionId,
    };
}

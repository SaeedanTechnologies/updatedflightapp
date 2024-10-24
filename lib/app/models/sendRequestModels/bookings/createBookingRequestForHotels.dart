// To parse this JSON data, do
//
//     final createBookingRequest = createBookingRequestFromJson(jsonString);

import 'dart:convert';

CreateBookingRequest createBookingRequestFromJson(String str) => CreateBookingRequest.fromJson(json.decode(str));

String createBookingRequestToJson(CreateBookingRequest data) => json.encode(data.toJson());

class CreateBookingRequest {
    final bool? status;
    final String? bookingReferenceId;
    final String? invoiceReferenceId;
    final String? bookingStatus;
    final String? invoiceStatus;

    CreateBookingRequest({
        this.status,
        this.bookingReferenceId,
        this.invoiceReferenceId,
        this.bookingStatus,
        this.invoiceStatus,
    });

    factory CreateBookingRequest.fromJson(Map<String, dynamic> json) => CreateBookingRequest(
        status: json["status"],
        bookingReferenceId: json["bookingReferenceId"],
        invoiceReferenceId: json["invoiceReferenceId"],
        bookingStatus: json["bookingStatus"],
        invoiceStatus: json["invoiceStatus"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "bookingReferenceId": bookingReferenceId,
        "invoiceReferenceId": invoiceReferenceId,
        "bookingStatus": bookingStatus,
        "invoiceStatus": invoiceStatus,
    };
}

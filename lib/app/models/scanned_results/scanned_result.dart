// To parse this JSON data, do
//
//     final scannedResult = scannedResultFromJson(jsonString);

import 'dart:convert';

ScannedResult scannedResultFromJson(String str) => ScannedResult.fromJson(json.decode(str));

String scannedResultToJson(ScannedResult data) => json.encode(data.toJson());

class ScannedResult {
    final bool? success;
    final Data? data;

    ScannedResult({
        this.success,
        this.data,
    });

    factory ScannedResult.fromJson(Map<String, dynamic> json) => ScannedResult(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    final String? message;
    final Tickets? tickets;
    final String? name;
    final int? numberOfAttendees;
    final String? email;
    final String? scanned;
    final String? alreadyAttended;

    Data({
        this.message,
        this.tickets,
        this.name,
        this.numberOfAttendees,
        this.email,
        this.scanned,
        this.alreadyAttended,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        tickets: json["tickets"] == null ? null : Tickets.fromJson(json["tickets"]),
        name: json["name"],
        numberOfAttendees: json["number_of_attendees"],
        email: json["email"],
        scanned: json["scanned"],
        alreadyAttended: json["already_attended"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "tickets": tickets?.toJson(),
        "name": name,
        "number_of_attendees": numberOfAttendees,
        "email": email,
        "scanned": scanned,
        "already_attended": alreadyAttended,
    };
}

class Tickets {
    final String? id;

    Tickets({
        this.id,
    });

    factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

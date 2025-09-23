import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:qr_code_scanner/app/models/scanned_results/scanned_result.dart';

class ScannedDataApi {
  Future<ScannedResult?> getScannedTicket({required List uniqueIds}) async {
    final url = Uri.parse(
      "https://charismauk.com/api/attendance/mark-attended",
    );
    final anAccessToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.9tL2FwyNywiZXhwIjoxNzU4MjE3NTsImp0aSI6Im9lY0JYQWs0YnNvNGd3b1MiLCJzdWIiOiI0IiwicHJ2I9.elHXNiGnX9u3o3T1A51I6mOyjH2amj6OZaJh-czWt24";
    final headers = {
      'Accept': 'application/json',
      'Access-token': anAccessToken,
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({"unique_ids": ["CMA001502","CMA001611"]});
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // log("Status code ---${response.body.toString()}");
        return scannedResultFromJson(response.body);
      } else {
        log("Status code ---${response.statusCode.toString()}");
        throw Exception('Failed to create device mode: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

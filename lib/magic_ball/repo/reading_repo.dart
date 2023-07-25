import 'dart:developer';

import 'package:surf_practice_magic_ball/magic_ball/model/reading.dart';
import 'package:http/http.dart' as http;

class ReadingRepo {
  static Future<Reading> fetchReading() async {
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse(
            'https://eightballapi.com/api',
          ),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          });
      Reading reading = Reading.fromJson(response.body);
      return reading;
    } catch (e) {
      log(e.toString());
      return Reading("");
    }
  }
}

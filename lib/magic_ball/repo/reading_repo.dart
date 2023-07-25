import 'dart:developer';

import 'package:surf_practice_magic_ball/magic_ball/model/reading.dart';
import 'package:http/http.dart' as http;

//class for fetching data from url
class ReadingRepo {
  static Future<Reading> fetchReading() async {
    var client = http.Client();
    try {
      var response = await client.get(
          //fettching datta
          Uri.parse(
            'https://eightballapi.com/api',
          ),
          headers: {
            //helped for self-testing in web
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          });
      Reading reading = Reading.fromJson(response.body); //decoding
      return reading; //result in needed format
    } catch (e) {
      log(e.toString());
      return Reading("Oh, it's too hard sorry:(\n($e)");
    }
  }
}

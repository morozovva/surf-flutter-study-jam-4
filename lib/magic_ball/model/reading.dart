// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//simple model of the data we fetch
class Reading {
  //it only has one sentence
  final String reading;

  Reading(this.reading);

  //useful methods every model might need

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reading': reading,
    };
  }

  factory Reading.fromMap(Map<String, dynamic> map) {
    return Reading(
      map['reading'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reading.fromJson(String source) =>
      Reading.fromMap(json.decode(source) as Map<String, dynamic>);
}

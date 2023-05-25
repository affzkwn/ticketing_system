//this function is to get time from json file and change it to minutes

import 'package:flutter/foundation.dart';

class Hourly {
  final String checkin;
  final String checkout;

  Hourly({
    required this.checkin,
    required this.checkout,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      checkin: json['detail'][0]['checkout'],
      checkout: json['detail'][0]['checkout'],
    );
  }
  int getMinutes(String time, minutes) {
    DateTime dateTime = DateTime.parse(time);
    int minutes = dateTime.hour * 60 + dateTime.minute;
    return minutes;
  }
}

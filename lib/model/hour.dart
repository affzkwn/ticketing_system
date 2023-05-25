//this function is to get time from json file and change it to minutes

import 'package:flutter/foundation.dart';

class Hourly {
  final String checkin;
  final String checkout;

  Hourly({
    required this.checkin,
    required this.checkout,
  });

  int getMinutes(String checkin, String checkout) {
    DateTime dateTime = DateTime.parse(checkin);
    DateTime dateTime2 = DateTime.parse(checkout);
    int totalminutes = (dateTime2.hour * 60 + dateTime2.minute) -
        (dateTime.hour * 60 + dateTime.minute);
    return totalminutes;
  }
}

//this function is to get the minutes from hour class and do the calculation for the amount which
//depends on the weekdays or weekend

import 'package:flutter/material.dart';
import 'package:ticketing_system/model/week.dart';
import 'package:ticketing_system/model/hour.dart';

class Payment {
  int addTime = 0;

  Future calculatePayment() async {
    Hourly hourly;
    Day day;
    switch (day.isWeekday(date)) {
      case true:
        if (hourly.getMinutes() < 15) {
          return 0;
        } else if (hourly.getMinutes() < 180) {
          return 3;
        } else {
          return 3 + ((hourly.getMinutes() - 180) / 60) * 1.5;
        }
      case false:
        if (hourly.getMinutes() < 15) {
          return 0;
        } else if (hourly.getMinutes() < 180) {
          return 5;
        } else {
          return 3 + ((hourly.getMinutes() - 180) / 60) * 2;
        }
    }
  }
}

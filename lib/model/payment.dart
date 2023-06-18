//this function is to get the minutes from hour class and do the calculation for the amount which
//depends on the weekdays or weekend

import 'package:flutter/material.dart';
import 'package:ticketing_system/model/week.dart';
import 'package:ticketing_system/model/hour.dart';

class Payment {
  final Hourly hourly;
  final WeekCategory weekCategory;

  Payment(
    this.hourly,
    this.weekCategory,
  );

  double calculatePayment(DateTime date) {
    int totalMinute = hourly.getMinutes(hourly.checkin, hourly.checkout);
    bool isWeekday = weekCategory.isWeekday(date);
    if (isWeekday) {
      if (totalMinute < 15) {
        return 0;
      } else if (totalMinute < 180) {
        return 3;
      } else {
        return 3 + ((totalMinute - 180) / 60) * 1.50;
      }
    } else {
      if (totalMinute < 15) {
        return 0;
      } else if (totalMinute < 180) {
        return 5;
      } else {
        return 5 + ((totalMinute - 180) / 60) * 2.00;
      }
    }
  }

  paymentAmount(DateTime time) {}
}

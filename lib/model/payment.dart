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
    double payment = 0.0;

    if (totalMinute >= 15) {
      int fullDaysWorked = totalMinute ~/ 1440;
      int remainingMinutes = totalMinute % 1440;

      // Calculate payment for full days
      if (isWeekday) {
        payment += fullDaysWorked * 20.0;
      } else {
        payment += fullDaysWorked * 40.0;
      }

      // Calculate payment for remaining minutes
      if (remainingMinutes >= 15) {
        if (isWeekday) {
          payment += 3.0 + ((remainingMinutes - 180) / 60) * 1.50;
          payment = payment > 20.0 ? 20.0 : payment;
        } else {
          payment += 5.0 + ((remainingMinutes - 180) / 60) * 2.00;
          payment = payment > 40.0 ? 40.0 : payment;
        }
      }
    }

    return payment;
  }

  paymentAmount(DateTime time) {}
}

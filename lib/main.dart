//main function to combine all the other function.

import 'package:flutter/material.dart';
import 'package:ticketing_system/model/hour.dart';
import 'dart:convert';
import 'dart:io';

import 'model/payment.dart';
import 'model/week.dart';

void main() {
  File file = File('file.json');
  String contents = file.readAsStringSync();
  List<dynamic> data = jsonDecode(contents);

  // Get the input of the registered car from the user
  stdout.write('Enter the registration number of the car: ');
  String? userRegNo = stdin.readLineSync()?.trim();

  bool isCarRegistered = false;

  for (var item in data) {
    String regNo = item['reg_no'];
    List<dynamic> details = item['details'];

    if (regNo == userRegNo) {
      isCarRegistered = true;
      print('Registration Number: $regNo');

      for (var detail in details) {
        String checkIn = detail['in'];
        String checkOut = detail['out'];

        Hourly hour = Hourly(checkin: checkIn, checkout: checkOut);
        WeekCategory weekCategory = WeekCategory();
        Payment payment = Payment(hour, weekCategory);

        for (var detail in details) {
          String checkIn = detail['in'];
          String checkOut = detail['out'];
          DateTime date = DateTime.parse(detail['date']);

          double paymentAmount = payment.calculatePayment(date);
          print('Payment Amount: $paymentAmount');
        }

        break; // Exit the loop after finding a match
      }
    }
  }

  if (!isCarRegistered) {
    print('The registration number $userRegNo is not found in the data.');
  }
}

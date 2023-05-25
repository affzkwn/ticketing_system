//main function to combine all the other function.

import 'package:flutter/material.dart';
import 'package:ticketing_system/model/hour.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  File file = File('file.json');
  String contents = file.readAsStringSync();
  List<dynamic> data = jsonDecode(contents);

  for (var item in data) {
    String regNo = item['reg_no'];
    List<dynamic> details = item['details'];

    print('Registration Number: $regNo');

    Hourly hour = Hourly();

    for (var detail in details) {
      String checkIn = detail['in'];
      String checkOut = detail['out'];

      int checkInMinutes = hour.getMinutes(checkIn);
      int checkOutMinutes = hour.getMinutes(checkOut);

      print('Check-in Time (minutes): $checkInMinutes');
      print('Check-out Time (minutes): $checkOutMinutes');
    }
  }
}

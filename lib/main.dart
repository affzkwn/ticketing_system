//main function to combine all the other function.

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ticketing_system/model/hour.dart';
import 'model/payment.dart';
import 'model/week.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketing System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _regNoController = TextEditingController();
  String _output = '';

  Future<String> _loadJSONFromAsset(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  void _processData() async {
    String regNo = _regNoController.text.trim();

    // Read the contents of the JSON file
    String fileContents = await rootBundle.loadString('assets/json/file.json');
    List<dynamic> data = jsonDecode(fileContents);

    bool isCarRegistered = false;
    String output = '';

    for (var item in data) {
      String carRegNo = item['reg_no'];
      List<dynamic> details = item['details'];

      if (carRegNo == regNo) {
        isCarRegistered = true;
        output += 'Registration Number: $carRegNo\n';

        for (var detail in details) {
          String checkIn = detail['checkin'];
          String checkOut = detail['checkout'];

          Hourly hour = Hourly(checkin: checkIn, checkout: checkOut);
          WeekCategory weekCategory = WeekCategory();
          Payment payment = Payment(hour, weekCategory);

          for (var detail in details) {
            String checkIn = detail['checkin'];
            String checkOut = detail['checkout'];
            DateTime date = DateTime.parse(detail['checkin']);

            double paymentAmount = payment.calculatePayment(date);
            output += 'Payment Amount: $paymentAmount\n';
          }

          break; // Exit the loop after finding a match
        }
      }
    }

    if (!isCarRegistered) {
      output = 'The registration number $regNo is not found in the data.';
    }
    setState(() {
      _output = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticketing System'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _regNoController,
                decoration: InputDecoration(
                  labelText: 'Registration Number',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _processData,
                child: Text('Process'),
              ),
              SizedBox(height: 16.0),
              Text(_output),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

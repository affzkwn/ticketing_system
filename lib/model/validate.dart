import 'package:ticketing_system/model/payment.dart';

class Validate {
  final Payment paymentTime;

  Validate(this.paymentTime);

  bool validateTicket(DateTime minute) {
    DateTime paymentDateTime = DateTime.parse(paymentTime.paymentTime);
    DateTime validStartTime = paymentDateTime;
    DateTime validEndTime = paymentDateTime.add(Duration(minutes: 5));

    if (minute.isBefore(validEndTime)) {
      print('Valid');
      return minute.isAfter(validStartTime) && minute.isBefore(validEndTime);
    } else {
      print('Invalid');
      return false;
    }
  }
}

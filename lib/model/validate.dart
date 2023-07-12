import 'package:ticketing_system/model/paydetail.dart';
import 'package:ticketing_system/model/payment.dart';

class Validate {
  final PayDetail paymentTime;

  Validate(this.paymentTime);

  bool validateTicket(DateTime ticketTime) {
    DateTime? paymentDateTime =
        paymentTime.paymentAmount.calculatePayment(ticketTime) >= 0
            ? DateTime.now()
            : null;

    if (paymentDateTime != null) {
      DateTime validEndTime = paymentDateTime.add(const Duration(minutes: 5));
      DateTime validStartTime = paymentDateTime.add(const Duration(minutes: 0));

      if (ticketTime.isBefore(validEndTime) &&
          ticketTime.isAfter(validStartTime)) {
        //suppose not string need to be integer
        print('Valid');
        return true;
      }
    }

    print('Invalid');
    return false;
  }
}

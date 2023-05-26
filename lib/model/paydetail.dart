import 'package:ticketing_system/model/payment.dart';

class PayDetail {
  final Payment paymentAmount;

  PayDetail(this.paymentAmount);

  bool _payDetail(DateTime time) {
    if (paymentAmount.paymentAmount != null) {
      DateTime currentTime = DateTime.now();
      // Use the currentTime as needed for validation or other purposes
      print('Current Time: $currentTime');
      return true;
    } else {
      print('Payment not completed');
      return false;
    }
  }
}

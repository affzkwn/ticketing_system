import 'package:ticketing_system/model/payment.dart';

class PayDetail {
  final Payment paymentAmount;

  PayDetail(this.paymentAmount);

  DateTime? getPaymentDetail() {
    if (paymentAmount.calculatePayment(DateTime.now()) >= 0) {
      return DateTime.now();
    }
    return null;
  }
}

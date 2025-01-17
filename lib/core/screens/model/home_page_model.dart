import 'package:flutter/material.dart';
import 'package:my_portfolio/service/email_service.dart';

class HomePageModel extends ChangeNotifier {
//   final emailService = EmailService();

  Future<void> sendMessageOnEmail(
      {required String message,
      required String email,
      required String name}) async {
    // await emailService.sendMessageInEmail(
    //     email: email, message: message, name: name);
    notifyListeners();
  }
}

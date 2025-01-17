import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  String username = '${dotenv.env['MY_EMAIL']}';
  String password = '${dotenv.env['MY_PASSWORD']}';
  // String username = 'rostyslav.kalabishka.code@gmail.com';
  // String password = 'zauz mpxr hfug bfzj';
  late final smtpServer;

  EmailService() {
    smtpServer = gmail(username, password);
  }

  Future<void> sendMessageInEmail(
      {required String message,
      required String email,
      required String name}) async {
    try {
      final emailMessage = Message()
        ..from = Address(username, username)
        ..recipients.add(username)
        ..subject = 'Message from $email'
        ..text = '''$email ($name)
      Message: $message 
       ''';

      final sendReport = await send(emailMessage, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailService {
  String username = '${dotenv.env['MY_EMAIL']}';
  String password = '${dotenv.env['MY_PASSWORD']}';

  Future<void> sendMessageInEmail(
      {required String message,
      required String email,
      required String name}) async {
    try {
      final apiKey = '${dotenv.env['API_KEY']}';
      final url = 'https://api.mailjet.com/v3.1/send';

      final headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('api:$apiKey'))}',
        'Content-Type': 'application/json',
      };

      final body = json.encode({
        'Messages': [
          {
            'From': {'Email': email},
            'To': [
              {'Email': username}
            ],
            'Subject': 'Question from $email ($username)',
            'TextPart': message,
          }
        ]
      });

      await http.post(Uri.parse(url), headers: headers, body: body);
    } catch (e) {
      rethrow;
    }
  }
}

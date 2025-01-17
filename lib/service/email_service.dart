// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class EmailService {
//   String username = '${dotenv.env['MY_EMAIL']}';
//   String password = '${dotenv.env['MY_PASSWORD']}';

//   Future<void> sendMessageInEmail({
//     required String email,
//     required String name,
//     required String message,
//   }) async {
//     final url = 'https://your-firebase-function-url/sendEmail';
//     final headers = {
//       'Content-Type': 'application/json',
//     };

//     final body = json.encode({
//       'subject': 'Question from $email ($name)',
//       'body': message,
//     });

//     final response =
//         await http.post(Uri.parse(url), headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print('Email sent successfully!');
//     } else {
//       print('Failed to send email: ${response.statusCode}');
//     }
//   }
// }

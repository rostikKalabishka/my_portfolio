import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailService {
  String username = '${dotenv.env['MY_EMAIL']}';
}

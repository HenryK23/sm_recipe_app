import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get apiId => dotenv.env['API_ID'] ?? '';
  static bool get debugBanner =>
      dotenv.env['DEBUG_BANNER'] == 'true' ? true : false;
}

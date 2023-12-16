import "package:flutter_dotenv/flutter_dotenv.dart";

final secureUri = dotenv.env['URI'];
String uri = secureUri!;

String signUpUrl = '$uri/api/signup';
String signInUrl = '$uri/api/signin';
String isTokenValidUrl = '$uri/IsTokenValid';

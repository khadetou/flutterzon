import "package:flutter_dotenv/flutter_dotenv.dart";

final secureUri = dotenv.env['URI'];
String uri = secureUri!;

String signUpUrl = '$uri/api/signup';
String signInUrl = '$uri/api/signin';
String isTokenValidUrl = '$uri/IsTokenValid';

String getUserDataUri = '$uri/';
String fetchMyOrdersUri = '$uri/api/orders/me';
String getAverageRatingLengthUri = '$uri/api/get-average-ratings-length';
String getAverageRatingUri = '$uri/api/get-ratings-average';
String getDealOfTheDayUri = '$uri/api/deal-of-the-day';

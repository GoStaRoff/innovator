import 'package:dio/dio.dart';

class InnovatorApi {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dncompany.fun",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}

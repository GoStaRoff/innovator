import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class InnovatorApi {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://65.108.50.45:8888",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<Response> sendRequest(String requestString, var data,
      {bool get = false}) async {
    var response;
    if (get) {
      response = await dio.get(
        "/api" + requestString,
      );
    } else {
      response = await dio.post(
        "/api" + requestString,
        data: data,
      );
    }
    return response;
  }

  static Future<Response> socialAuth({
    required String email,
    required String fullName,
    required String photoUrl,
  }) async {
    var json = {
      "email": email,
      "fullName": fullName,
      "photoUrl": photoUrl,
    };

    return sendRequest("/social_auth", json);
  }

  static Future<Response> reportError({
    required int clientId,
    required String customEmail,
    required String messageText,
  }) async {
    var json = {
      "customEmail": customEmail,
      "messageText": messageText,
    };

    return sendRequest("/report_error/$clientId", json);
  }

  static Future<Response> sendRecommendation({
    required int clientId,
    required String customEmail,
    required String messageText,
  }) async {
    var json = {
      "customEmail": customEmail,
      "messageText": messageText,
    };

    return sendRequest("/send_recommendation/$clientId", json);
  }

  static Future<Response> sendRecommendationNews({
    required int clientId,
    required String customEmail,
    required String messageText,
  }) async {
    var json = {
      "customEmail": customEmail,
      "messageText": messageText,
    };

    return sendRequest("/send_recommendation_news/$clientId", json);
  }

  static Future<Response> setProfileAvatar({
    required int clientId,
    required File clientAvatar,
  }) async {
    var avatar = MultipartFile.fromBytes(
      clientAvatar.readAsBytesSync(),
      filename: clientAvatar.path.split("/").last,
      contentType: MediaType(
        'image',
        'jpg',
      ),
    );
    FormData formData = FormData.fromMap(
      {
        "avatar": avatar,
      },
    );

    return sendRequest("/set_profile_avatar/$clientId", formData);
  }

  static Future<Response> getNews() async {
    return sendRequest("/news", null, get: true);
  }
}

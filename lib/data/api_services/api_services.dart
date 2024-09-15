import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_app/Constants/api.dart';
import 'package:gallery_app/Constants/api_key.dart';

class ApiServices {
  int page = 1; // Track the page number
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      headers: {'Authorization': apiKey},
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getWallpapers() async {
    try {
      Response response = await dio.get('curated?per_page=50&page=$page');
      return response.data['photos'];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  void incrementPage() {
    page++;
  }
}
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gallery_app/Constants/api.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getWallpapers() async {
    try {
      Response response = await dio.get('curated?per_page=10');
      log('${response.data['photos']}');
      return response.data['photos'];
    } catch (e) {
      log('${e.toString()}');
      return [];
    }
  }
}

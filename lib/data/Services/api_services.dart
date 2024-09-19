import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_app/Constants/api.dart';
import 'package:gallery_app/Constants/api_key.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getHomePage() async {
    try {
      Response response = await dio.get(
          'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b');
      log('${response.data['results']}');
      return response.data['results'];
    } catch (e) {
      log('ERROR:${e.toString()}');
      return [];
    }
  }
}

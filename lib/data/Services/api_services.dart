import 'dart:developer';

import 'package:dio/dio.dart';

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
      return response.data['results'];
    } catch (e) {
      log('ERROR:${e.toString()}');
      return [];
    }
  }

  Future<Map<String, dynamic>> getActorInfo(int id) async {
    try {
      Response response = await dio.get(
          'https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b');
      return response.data;
    } catch (e) {
      log('ERROR:${e.toString()}');
      return {};
    }
  }

  Future<List<dynamic>> getImages(int id) async {
    try {
      Response response = await dio.get(
          'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b');
      return response.data['profiles'];
    } catch (e) {
      log('ERROR:${e.toString()}');
      return [];
    }
  }
}

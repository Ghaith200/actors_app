import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_app/Core/helpers/api.dart';
import 'package:gallery_app/Core/helpers/api_key.dart';

class SearchApi {
  late Dio dio;

  SearchApi() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> searchPerson(String text) async {
    try {
      Response response = await dio.get(
          'https://api.themoviedb.org/3/search/person?query=${text}&api_key=2dfe23358236069710a379edd4c65a6b');
      log(response.data['results'].toString());
      return response.data['results'];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

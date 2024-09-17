import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_app/Constants/api.dart';
import 'package:gallery_app/Constants/api_key.dart';

class SearchPicApi {
  late Dio dio;
  late String txt;
  late String oriantation = '';
  SearchPicApi({required this.txt, required this.oriantation}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      headers: {'Authorization': apiKey},
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> searchPic() async {
    try {
      Response response = await dio.get('search?query=$txt&per_page=10');
      return response.data['photos'];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

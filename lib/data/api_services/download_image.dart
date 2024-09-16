import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadImage {
  late String imgurl;

  DownloadImage({required this.imgurl});

    Future<void> downloadImage() async {
    Dio dio = Dio();
    try {
      var pathInStorage = await getApplicationDocumentsDirectory();
      await dio.download(
        imgurl,
        '${pathInStorage.path}/sampleimage.jpg',
        onReceiveProgress: (count, total) {
          
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}

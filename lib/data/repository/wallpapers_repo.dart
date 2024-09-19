// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

class WallpapersRepo {
  final ApiServices apiServices;

  WallpapersRepo(this.apiServices);
  Future<List<HomePageModel>> getHomePage() async {
    final wallpapers = await apiServices.getHomePage();
    return wallpapers
        .map((wallpapers) => HomePageModel.fromJson(wallpapers))
        .toList();
  }
}

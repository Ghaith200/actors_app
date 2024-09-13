// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gallery_app/data/api_services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

class WallpapersRepo {
  final  ApiServices apiServices ;

  WallpapersRepo(this.apiServices);
  Future<List<dynamic>> getWallpapers() async {
   final wallpapers = await apiServices.getWallpapers();
   return wallpapers.map((wallpapers) => Wallpaper.fromjson(wallpapers)).toList(); 
  }

}
// ignore_for_file: non_constant_identifier_names

class Wallpaper {
  late int wallpaper_id;
  late int wallpaper_width;
  late int wallpaper_height;
  late String wallpaper_url;
  late String wallpaper_photographer;
  late String wallpaper_photographer_url;
  late String wallpaper_photographer_id;
  late String wallpaper_avg_color;
  late Map wallpaper_src;
  late String wallpaper_liked;
  late String wallpaper_alt;

  Wallpaper.fromjson(Map<String, dynamic> json) {
    wallpaper_id = json['id'];
    wallpaper_width = json['width'];
    wallpaper_height = json['height'];
    wallpaper_url = json['url'];
    wallpaper_photographer = json['photographer'];
    wallpaper_photographer_url = json['photographer_url'];
    wallpaper_photographer_id = json['photographer_id'];
    wallpaper_avg_color = json['avg_color'];
    wallpaper_src = json['src'];
    wallpaper_liked = json['liked'];
    wallpaper_alt = json['alt'];
  }
}

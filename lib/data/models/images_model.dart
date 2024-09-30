import 'dart:ffi';

class ImagesModel {
  double? aspect_ratio;
  int? height;
  String? iso_639_1;
  String? file_path;
  double? vote_average;
  int? vote_count;
  int? width;

  ImagesModel(
      {this.aspect_ratio,
      this.height,
      this.iso_639_1,
      this.file_path,
      this.vote_average,
      this.vote_count,
      this.width});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    aspect_ratio = json['aspect_ratio'];
    height = json['height'];
    iso_639_1 = json['iso_639_1'];
    file_path = json['file_path'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
    width = json['width'];
  }
}

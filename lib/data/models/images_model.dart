class ImagesModel {
  double? aspectRatio;
  int? height;
  String? iso_639_1;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  ImagesModel(
      {this.aspectRatio,
      this.height,
      this.iso_639_1,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspectRatio'];
    height = json['height'];
    iso_639_1 = json['iso_639_1'];
    filePath = json['filePath'];
    voteAverage = json['voteAverage'];
    voteCount = json['voteCount'];
    width = json['width'];
  }
}

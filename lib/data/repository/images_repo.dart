// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gallery_app/Core/helpers/pageroute.dart';
import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/images_model.dart';

class ImagesRepo {
  final ApiServices apiServices;
  final HomePageModel homePageModel;

  ImagesRepo(this.apiServices, this.homePageModel);
  Future<List<ImagesModel>> getImages() async {
    final image = await apiServices.GetImages(homePageModel.id!);
    return image.map((image) => ImagesModel.fromJson(image)).toList();
  }
}

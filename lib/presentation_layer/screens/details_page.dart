import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

class DetailsPage extends StatelessWidget {
  final Wallpaper wallpaper;
  const DetailsPage({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(wallpaper.wallpaper_alt),
        ),
        body: Container(
          color: MyColors.myGrey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: CachedNetworkImage(
                  imageUrl: wallpaper.wallpaper_src['large'],
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

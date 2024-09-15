import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

class WallpaperWidget extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperWidget({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridTile(
          child: Container(
              color: MyColors.myGrey,
              child: CachedNetworkImage(
                imageUrl:
                    wallpaper.wallpaper_src['portrait'],
                fit: BoxFit.cover,
                placeholder: (context, url) => Icon(Icons.image),
              )),
          footer: Container(
            width: double.infinity,
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${wallpaper.wallpaper_alt}',
              style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myWhite),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/presentation_layer/screens/details_page.dart';

class WallpaperWidget extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperWidget({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GridTile(
          // ignore: sort_child_properties_last
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(wallpaper: wallpaper),
              ));
            },
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: MyColors.myGrey,
                ),
                child: CachedNetworkImage(
                  imageUrl: wallpaper.wallpaper_src['original'],
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Image.asset('assets/images/Loading.gif'),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image_outlined),
                )),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: wallpaper.wallpaper_alt.isEmpty
                ? const Text(
                    'No Description',
                    style: TextStyle(
                        height: 1.3,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myWhite),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  )
                : Text(
                    wallpaper.wallpaper_alt,
                    style: const TextStyle(
                        height: 1.3,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColors.myWhite),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
          ),
        ));
  }
}

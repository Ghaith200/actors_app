import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:image_downloader/image_downloader.dart';

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
          color: MyColors.myWhite,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: CachedNetworkImage(
                  imageUrl: wallpaper.wallpaper_src['large'],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                      'assets/images/Loading.gif',
                      fit: BoxFit.cover),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ListTile(
                title: Text(
                  wallpaper.wallpaper_alt,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  wallpaper.wallpaper_photographer,
                  style: TextStyle(color: Colors.black),
                ),
                trailing: wallpaper.wallpaper_liked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // await ImageDownloader.downloadImage(
                    //   wallpaper.wallpaper_src['large'],
                    //   destination:
                    //       AndroidDestinationType.custom(directory: 'Ghaith/')
                    //         ..inExternalFilesDir()
                    //         ..subDirectory("custom/sample.gif"),
                    // );
                  },
                  child: Icon(Icons.download))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/api_services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/presentation_layer/widgets/custom_circle_progress_indecator.dart';
import 'package:path_provider/path_provider.dart';

class DetailsPage extends StatefulWidget {
  final Wallpaper wallpaper;
  const DetailsPage({super.key, required this.wallpaper});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double? _progress;
  @override
  Widget build(BuildContext context) {
    String progressValue = '';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.wallpaper.wallpaper_alt),
          backgroundColor: MyColors.myYellow,
        ),
        body: Container(
          color: MyColors.myWhite,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: CachedNetworkImage(
                  imageUrl: widget.wallpaper.wallpaper_src['large'],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                      'assets/images/Loading.gif',
                      fit: BoxFit.cover),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ListTile(
                title: Text(
                  widget.wallpaper.wallpaper_alt,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  widget.wallpaper.wallpaper_photographer,
                  style: TextStyle(color: Colors.black),
                ),
                trailing: widget.wallpaper.wallpaper_liked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: _progress != null
                    ? CustomCircleProgressIndecator()
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(MyColors.myGrey),
                            foregroundColor:
                                WidgetStateProperty.all(MyColors.myYellow)),
                        onPressed: () {
                          FileDownloader.downloadFile(
                              url: widget.wallpaper.wallpaper_src['original'],
                              onProgress: (name, progress) {
                                setState(() {
                                  _progress = progress;
                                });
                              },
                              onDownloadCompleted: (value) {
                                print('path  $value ');
                                setState(() {
                                  _progress = null;
                                });
                              });
                        },
                        child: Icon(Icons.download),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

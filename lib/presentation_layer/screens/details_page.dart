import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/data/models/actor_info_model.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/images_model.dart';
import 'package:gallery_app/data/repository/actor_info_repo.dart';
import 'package:gallery_app/data/repository/images_repo.dart';
import 'package:gallery_app/presentation_layer/widgets/my_progress_indecator.dart';
import 'package:gallery_app/presentation_layer/widgets/my_sperater.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.wallpaper,
    required this.imagesId,
  });
  final int imagesId;
  final HomePageModel wallpaper;
  late ImagesModel imagesModel;
  late List<ImagesModel> images = [];
  late ActorInfoModel actorInfo = ActorInfoModel();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    ImagesRepo imagesRepo = ImagesRepo(apiServices, widget.wallpaper);
    widget.images = await imagesRepo.getImages();
    ActorInfoRepo actorInfoRepo = ActorInfoRepo(apiServices, widget.wallpaper);
    final info = await actorInfoRepo.getInfo();
    setState(() {
      widget.actorInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.wallpaper.name!,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.6,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      pauseAutoPlayOnTouch: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    ),
                    items: [
                      for (int i = 0; i < widget.images.length; i++)
                        Container(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${widget.images[i].file_path}',
                            placeholder: (context, url) =>
                                MyCircleProgressIndecator(),
                          ),
                        ),
                    ],
                  ),
                  MySperater(),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name : ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text(
                          widget.wallpaper.name == null
                              ? "No Name Found"
                              : ' ${widget.wallpaper.name}',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    MySperater(),
                    widget.actorInfo.alsoKnownAs == null ||
                            widget.actorInfo.alsoKnownAs!.isEmpty
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Also Known As : ',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                widget.actorInfo.alsoKnownAs!.isEmpty
                                    ? "No Also Known As"
                                    : '${widget.actorInfo.alsoKnownAs}',
                              ),
                              MySperater(),
                            ],
                          ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Biography : ',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(widget.actorInfo?.biography == null ||
                            widget.actorInfo?.biography == ''
                        ? "No Bio "
                        : '${widget.actorInfo?.biography}'),
                    MySperater(),
                    Row(
                      children: [
                        Text(
                          'Birthday : ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(widget.actorInfo?.birthday == null ||
                                widget.actorInfo?.birthday == ''
                            ? "No Birthday"
                            : '${widget.actorInfo?.birthday}'),
                      ],
                    ),
                    MySperater(),
                    Text(
                      'Place of Birth : ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(widget.actorInfo?.placeOfBirth == null ||
                            widget.actorInfo?.placeOfBirth == ''
                        ? "No Place of Birth"
                        : '${widget.actorInfo?.placeOfBirth}'),
                    MySperater(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:developer';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:gallery_app/Constants/my_colors.dart';
// import 'package:gallery_app/data/models/home_page_model.dart';
// import 'package:gallery_app/presentation_layer/widgets/custom_circle_progress_indecator.dart';

// class DetailsPage extends StatefulWidget {
//   final HomePage wallpaper;
//   const DetailsPage({super.key, required this.wallpaper});

//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   double? _progress;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             widget.wallpaper.name!,
//             style: TextStyle(color: Theme.of(context).colorScheme.primary),
//           ),
//           backgroundColor: MyColors.myYellow,
//         ),
//         body: Container(
//           // ignore: deprecated_member_use
//           color: Theme.of(context).colorScheme.background,
//           child: ListView(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 400,
//               ),
//               ListTile(
//                 title: Text(
//                   widget.wallpaper.wallpaper_alt.isEmpty
//                       ? "No Discription"
//                       : widget.wallpaper.wallpaper_alt,
//                   softWrap: true,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                 ),
//                 subtitle: Text(
//                   widget.wallpaper.wallpaper_photographer,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                 ),
//                 trailing: widget.wallpaper.wallpaper_liked
//                     ? const Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       )
//                     : const Icon(
//                         Icons.favorite_border,
//                         color: Colors.red,
//                       ),
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
//                 child: _progress != null
//                     ? const CustomCircleProgressIndecator()
//                     : ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: WidgetStateProperty.all(
//                                 Theme.of(context).colorScheme.primary),
//                             foregroundColor:
//                                 WidgetStateProperty.all(MyColors.myGrey)),
//                         onPressed: () {
//                           FileDownloader.downloadFile(
//                               url: widget.wallpaper.wallpaper_src['original'],
//                               onProgress: (name, progress) {
//                                 setState(() {
//                                   _progress = progress;
//                                 });
//                               },
//                               onDownloadCompleted: (value) {
//                                 log('path  $value ');
//                                 setState(() {
//                                   _progress = null;
//                                 });
//                               });
//                         },
//                         child: Icon(
//                           Icons.download,
//                           color: Theme.of(context).colorScheme.tertiary,
//                         ),
//                       ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

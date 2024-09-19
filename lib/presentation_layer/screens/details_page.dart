import 'package:flutter/material.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/images_model.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.wallpaper, required this.imagesId});
  final HomePageModel wallpaper;
  final imagesId;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
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
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.wallpaper.profilePath}',
                  fit: BoxFit.cover,
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

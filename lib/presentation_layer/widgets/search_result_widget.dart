import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/images_model.dart';
import 'package:gallery_app/data/models/search_model.dart';
import 'package:gallery_app/presentation_layer/screens/details_page.dart';
import 'package:gallery_app/presentation_layer/widgets/my_progress_indecator.dart';

class SearchWidget extends StatelessWidget {
  final SearchModel searchModel;

  const SearchWidget({
    super.key,
    required this.searchModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.fromSTEB(5, 8, 5, 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GridTile(
          // ignore: sort_child_properties_last
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                  wallpaper: HomePageModel(
                    id: searchModel.id,
                    name: searchModel.title,
                    profilePath: searchModel.posterPath,
                  ),
                  imagesId: searchModel.id!,
                ),
              ));
            },
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: MyColors.myGrey,
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${searchModel.posterPath}',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              searchModel.title == null
                  ? 'We Dont Have a titles Yet'
                  : searchModel.title!,
              style: TextStyle(
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

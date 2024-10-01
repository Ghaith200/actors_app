import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Core/helpers/my_colors.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/Features/details/ui/details_page.dart';

class SearchWidget extends StatelessWidget {
  final HomePageModel home_page_model;

  const SearchWidget({
    super.key,
    required this.home_page_model,
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
                    id: home_page_model.id,
                    name: home_page_model.name,
                    profilePath: home_page_model.profilePath,
                  ),
                  imagesId: home_page_model.id!,
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
                      'https://image.tmdb.org/t/p/w500${home_page_model.profilePath}',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
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
              home_page_model.name == null
                  ? 'We Dont Have a titles Yet'
                  : home_page_model.name!,
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/Constants/pageroute.dart';
import 'package:gallery_app/data/Services/search_api.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/models/search_model.dart';
import 'package:gallery_app/presentation_layer/widgets/my_progress_indecator.dart';
import 'package:gallery_app/presentation_layer/widgets/search_result_widget.dart';
import 'package:gallery_app/presentation_layer/widgets/wallpaper_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _controller = ScrollController();
  TextEditingController searchController = TextEditingController();
  late List<HomePageModel> allWallpapers = [];

  Widget buildBlocWidget() {
    return allWallpapers.isEmpty && searchController.text.isNotEmpty
        ? showLoadingIndicator()
        : buildLoadedListWidget();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: MyCircleProgressIndecator(),
    );
  }

  Widget buildLoadedListWidget() {
    log(searchController.text.trim().toString());
    return searchController.text.isNotEmpty
        ? SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                buildWallpaperList(),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          )
        : Center(
            child: Text(
              "Search Something...",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          );
  }

  Widget buildWallpaperList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allWallpapers.length,
      itemBuilder: (context, index) {
        return WallpaperWidget(homePageModel: allWallpapers[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: MyColors.myYellow,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).colorScheme.background,
                      )),
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: MyColors.myGrey,
                      decoration: InputDecoration(
                          focusColor: MyColors.myWhite,
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: MyColors.myGrey),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      onFieldSubmitted: (value) async {
                        allWallpapers.clear();
                        final image = await SearchApi()
                            .searchPerson(searchController.text.trim());
                        setState(() {
                          allWallpapers = image
                              .map((image) => HomePageModel.fromJson(image))
                              .toList();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: buildBlocWidget()),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

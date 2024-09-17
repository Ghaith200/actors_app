import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/Services/search_pic_api.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/presentation_layer/widgets/custom_circle_progress_indecator.dart';

import 'package:gallery_app/presentation_layer/widgets/wallpaper_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _controller = ScrollController();
  TextEditingController searchController = TextEditingController();
  late List<Wallpaper> allWallpapers = [];
  String? selectedOption;

  Widget buildBlocWidget() {
    return allWallpapers.isEmpty && searchController.text.isNotEmpty
        ? showLoadingIndicator()
        : buildLoadedListWidget();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CustomCircleProgressIndecator(),
    );
  }

  Widget buildLoadedListWidget() {
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
        return WallpaperWidget(wallpaper: allWallpapers[index]);
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
                          suffixIcon: IconButton(
                              onPressed: () {
                                _showFilterDialog();
                              },
                              icon: Icon(
                                Icons.filter_list_rounded,
                                color: Theme.of(context).colorScheme.background,
                              )),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      onFieldSubmitted: (value) async {
                        List<dynamic> newWallpapers = await SearchPicApi(
                                txt: searchController.text,
                                oriantation: '$selectedOption')
                            .searchPic();
                        setState(() {
                          allWallpapers.clear();
                          allWallpapers.addAll(newWallpapers
                              .map((w) => Wallpaper.fromjson(w))
                              .toList());
                        });
                        log('$selectedOption');
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

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text("Select Filter",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.not_interested,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "None",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () {
                  _setFilterOption("");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.landscape_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "landscape",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () {
                  _setFilterOption("landscape");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.portrait_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "portrait",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () {
                  _setFilterOption("portrait");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.crop_square_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "square",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                onTap: () {
                  _setFilterOption("square");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _setFilterOption(String option) async {
    setState(() {
      selectedOption = option;
    });
    log("$selectedOption");
    Navigator.pop(context);
    allWallpapers.clear();
    List<dynamic> newWallpapers = await SearchPicApi(
            txt: searchController.text, oriantation: '$selectedOption')
        .searchPic();
    setState(() {
      allWallpapers.clear();
      allWallpapers
          .addAll(newWallpapers.map((w) => Wallpaper.fromjson(w)).toList());
    });
  }
}

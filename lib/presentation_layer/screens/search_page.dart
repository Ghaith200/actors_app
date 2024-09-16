import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/api_services/search_pic_api.dart';
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
        : const Center(
            child: Text("Search Something"),
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
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                          focusColor: MyColors.myWhite,
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: MyColors.myGrey),
                          suffixIcon: IconButton(
                              onPressed: () {
                                searchController.clear();
                              },
                              icon: const Icon(Icons.close)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      onFieldSubmitted: (value) async {
                        List<dynamic> newWallpapers =
                            await SearchPicApi(txt: searchController.text)
                                .searchPic();
                        setState(() {
                          allWallpapers.clear();
                          allWallpapers.addAll(newWallpapers
                              .map((w) => Wallpaper.fromjson(w))
                              .toList());
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child:
                    Container(color: MyColors.myGrey, child: buildBlocWidget()),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

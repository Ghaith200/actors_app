
import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/data/repository/wallpapers_repo.dart';
import 'package:gallery_app/presentation_layer/screens/search_page.dart';
import 'package:gallery_app/presentation_layer/widgets/my_drawer.dart';
import 'package:gallery_app/presentation_layer/widgets/my_progress_indecator.dart';
import 'package:gallery_app/presentation_layer/widgets/wallpaper_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<HomePageModel> homePageModel = [];
  ApiServices apiServices = ApiServices();
  late WallpapersRepo wallpapersRepo;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    wallpapersRepo = WallpapersRepo(apiServices);
    homePageModel = await wallpapersRepo.getHomePage();

    setState(() {});
  }

  Widget buildBlocWidget() {
    return homePageModel.isEmpty
        ? showLoadingIndicator()
        : buildLoadedListWidget();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: MyCircleProgressIndecator(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildWallpaperList(),
        ],
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
      itemCount: homePageModel.length,
      itemBuilder: (context, index) {
        return WallpaperWidget(
          homePageModel: homePageModel[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.myGrey,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(color: MyColors.myGrey),
          ),
          backgroundColor: MyColors.myYellow,
          leading: Builder(
            // Wrap IconButton with Builder to provide correct context
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: MyColors.myGrey,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SearchPage()));
              },
              icon: const Icon(
                Icons.search,
                color: MyColors.myGrey,
              ),
            ),
          ],
        ),
        // Display the bloc widget (either loading or data)
        body: Container(
            color: Theme.of(context).colorScheme.background,
            child: buildBlocWidget()),
      ),
    );
  }
}

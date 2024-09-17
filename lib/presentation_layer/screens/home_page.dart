import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/data/api_services/api_services.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/presentation_layer/widgets/my_drawer.dart';
import 'package:gallery_app/presentation_layer/widgets/wallpaper_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Wallpaper> allWallpapers;
  ScrollController _controller = ScrollController();
  bool isLoadingMore = false;
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    allWallpapers = [];
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _fetchInitialWallpapers();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent &&
        !isLoadingMore) {
      _fetchMoreWallpapers();
    }
  }

  void _fetchInitialWallpapers() async {
    // Fetch the initial data when the screen loads
    List<dynamic> wallpapers = await apiServices.getWallpapers();
    setState(() {
      allWallpapers = wallpapers.map((w) => Wallpaper.fromjson(w)).toList();
    });
  }

  void _fetchMoreWallpapers() async {
    setState(() {
      isLoadingMore = true;
    });

    apiServices.incrementPage(); // Increment the page number

    List<dynamic> newWallpapers =
        await apiServices.getWallpapers(); // Call API to get more data

    setState(() {
      allWallpapers.addAll(newWallpapers
          .map((w) => Wallpaper.fromjson(w))
          .toList()); // Append new data
      isLoadingMore = false;
    });
  }

  Widget buildBlocWidget() {
    return allWallpapers.isEmpty
        ? showLoadingIndicator()
        : buildLoadedListWidget();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          buildWallpaperList(),
          if (isLoadingMore) // Show loading indicator when fetching more data
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                color: MyColors.myYellow,
              ),
            ),
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
      itemCount: allWallpapers.length,
      itemBuilder: (context, index) {
        return WallpaperWidget(wallpaper: allWallpapers[index]);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.myGrey,
        drawer: const MyDrawer(), // The drawer is defined here
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(color: MyColors.myGrey),
          ),
          backgroundColor: MyColors.myYellow,
          leading: Builder(
            // Wrap the IconButton with Builder to provide the correct context
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: MyColors.myGrey, // Same color as the search icon
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/SearchPage');
              },
              icon: const Icon(
                Icons.search,
                color: MyColors.myGrey, // Search icon color
              ),
            ),
          ],
        ),
        body: Container(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.background,
            child: buildBlocWidget()),
      ),
    );
  }
}

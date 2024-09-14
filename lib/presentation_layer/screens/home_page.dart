import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/bussiness_logic/cubit/home_screen_cubit.dart';
import 'package:gallery_app/data/models/home_page_model.dart';
import 'package:gallery_app/presentation_layer/widgets/wallpaper_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Wallpaper> allWallpapers;

  @override
  @override
  void initState() {
    super.initState();
    allWallpapers = BlocProvider.of<HomeScreenCubit>(context).getWallpapers();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
      if (state is HomeScreenloaded) {
        allWallpapers = (state).wallpaper;
        return buildLoadedListWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }
  Widget showLoadingIndicator() {
    return con
  }
  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildWallpaperList(),
          ],
        ),
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
      itemCount: 2,
      itemBuilder: ( context,  index) {
        // ToDo: Not Done
        return WallpaperWidget();
      },
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: MyColors.myYellow,
        ),
        body: buildBlocWidget(),
      ),
    );
  }
}

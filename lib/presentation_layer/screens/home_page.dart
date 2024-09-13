import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/Constants/my_colors.dart';
import 'package:gallery_app/bussiness_logic/cubit/home_screen_cubit.dart';
import 'package:gallery_app/data/models/home_page_model.dart';

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
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page") , backgroundColor: MyColors.myYellow,),
        body: Container(
          child: const Center(
            child: Text('Home Page'),
          ),
        ),
      ),
    );
  }
}
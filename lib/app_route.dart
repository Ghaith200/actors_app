import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/Constants/pageroute.dart';
import 'package:gallery_app/bussiness_logic/cubit/home_screen/home_screen_cubit.dart';
import 'package:gallery_app/data/api_services/api_services.dart';
import 'package:gallery_app/data/repository/wallpapers_repo.dart';
import 'package:gallery_app/presentation_layer/screens/details_page.dart';
import 'package:gallery_app/presentation_layer/screens/home_page.dart';

class AppRoute {

  late WallpapersRepo wallpapersRepo;
  late HomeScreenCubit homeScreenCubit;
  AppRoute(){
    wallpapersRepo = WallpapersRepo(ApiServices());
    homeScreenCubit = HomeScreenCubit(wallpapersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create:(BuildContext context) => HomeScreenCubit(wallpapersRepo),
          child :const HomePage()

          ),
        );
      case detailpage:
        return MaterialPageRoute(
          builder: (_) => const DetailsPage(),
        );
    }
    return null;
  }
}

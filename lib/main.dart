import 'package:flutter/material.dart';
import 'package:gallery_app/app_route.dart';
import 'package:gallery_app/data/api_services/api_services.dart';

void main() {
  runApp(GalleryApp(
    appRoute: AppRoute(),
  ));

}

class GalleryApp extends StatelessWidget {
  final AppRoute appRoute;

  const GalleryApp({super.key, required this.appRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}

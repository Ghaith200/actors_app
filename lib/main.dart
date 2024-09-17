import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery_app/app_route.dart';
import 'package:gallery_app/presentation_layer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: GalleryApp(
      appRoute: AppRoute(),
    ),
  ));
}

class GalleryApp extends StatelessWidget {
  final AppRoute appRoute;

  const GalleryApp({super.key, required this.appRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}

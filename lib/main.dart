import 'package:flutter/material.dart';
import 'package:gallery_app/app_route.dart';
import 'package:gallery_app/data/Services/api_services.dart';
import 'package:gallery_app/Core/theming/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const AppInitializer(),
    ),
  );
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return FutureBuilder(
      future: themeProvider.loadThemeFromPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GalleryApp(appRoute: AppRoute());
        }
      },
    );
  }
}

class GalleryApp extends StatelessWidget {
  final AppRoute appRoute;

  GalleryApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    apiServices.getHomePage();
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}

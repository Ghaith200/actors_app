import 'package:flutter/material.dart';
import 'package:gallery_app/app_route.dart';
import 'package:gallery_app/presentation_layer/themes/theme_provider.dart';
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

    // Return a FutureBuilder to ensure the theme is loaded
    return FutureBuilder(
      future: themeProvider.loadThemeFromPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show splash screen or loading while waiting
          return const Center(child: CircularProgressIndicator());
        } else {
          return GalleryApp(appRoute: AppRoute());
        }
      },
    );
  }
}

class GalleryApp extends StatelessWidget {
  final AppRoute appRoute; // Custom app routes

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

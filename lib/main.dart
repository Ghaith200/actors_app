// Necessary for some UI-related operations
import 'package:flutter/material.dart';
import 'package:gallery_app/app_route.dart'; // Your custom app routing
import 'package:gallery_app/presentation_layer/themes/theme_provider.dart'; // Theme provider import
import 'package:provider/provider.dart'; // Import provider for state management

void main() {
  // Wrapping the app in a ChangeNotifierProvider to provide ThemeProvider globally
  runApp(
    ChangeNotifierProvider(
      // Creating an instance of ThemeProvider which will manage the theme of the app
      create: (context) => ThemeProvider(),
      child: GalleryApp(
        appRoute: AppRoute(), // Pass custom routing object
      ),
    ),
  );
}

class GalleryApp extends StatelessWidget {
  final AppRoute appRoute; // Custom app routes

  const GalleryApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing the current theme to the MaterialApp using ThemeProvider
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false, // Hides the debug banner in the app
      onGenerateRoute:
          appRoute.generateRoute, // Route generation using the AppRoute class
    );
  }
}

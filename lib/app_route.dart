import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/pageroute.dart';
import 'package:gallery_app/presentation_layer/screens/details_page.dart';
import 'package:gallery_app/presentation_layer/screens/home_page.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case detailpage:
        return MaterialPageRoute(
          builder: (_) => DetailsPage(),
        );
    }
  }
}

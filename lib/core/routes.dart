import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/app/view/detail_screen/detail_screen.dart';
import 'package:restaurant_app/app/view/home_screen/home_screen.dart';

class AppRoute {
  CupertinoPageRoute? appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
      case '/detail':
        return CupertinoPageRoute(
            builder: (_) => const DetailScreen(), settings: settings);
    }
    return null;
  }
}

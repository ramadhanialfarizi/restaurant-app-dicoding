import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/app/view/home_screen/home_screen.dart';

class AppRoute {
  CupertinoPageRoute? appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
    }
    return null;
  }
}

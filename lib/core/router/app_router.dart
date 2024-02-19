import 'package:flutter/material.dart';

import '../../feature/home/presentation/home_screen.dart';
import '../../feature/not_found/presentation/not_found_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        RouteNames.homeScreen => MaterialPageRoute(
            builder: (final context) => const HomeScreen(),
          ),
        _ => MaterialPageRoute(
            builder: (final context) => const NotFoundScreen(),
          ),
      };
}

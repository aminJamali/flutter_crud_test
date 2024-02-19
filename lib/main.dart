import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/router/route_names.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getThemeData(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouteNames.homeScreen,
      );
}

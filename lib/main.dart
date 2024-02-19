import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/router/app_router.dart';
import 'core/router/route_names.dart';
import 'core/theme/app_theme.dart';
import 'feature/customer_list/presentation/bindings/customer_list_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomerListGetIt.init();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

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

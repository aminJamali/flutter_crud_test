import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/customer_list/domain/use_case/get_all_customers_use_case.dart';
import '../../feature/customer_list/presentation/bloc/get_all_customers_bloc.dart';
import '../../feature/customer_list/presentation/customer_list_screen.dart';
import '../../feature/customer_list/presentation/injection/customer_list_injection.dart';
import '../../feature/not_found/presentation/not_found_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        RouteNames.homeScreen => MaterialPageRoute(
            builder: (final context) => BlocProvider(
                create: (final context) => GetAllCustomersBloc(
                  getAllCustomersUseCase: CustomerListInjection.customerListGetIt<
                      GetAllCustomersUseCase>(),
                ),
                child: const CustomerListScreen(),
              ),
          ),
        _ => MaterialPageRoute(
            builder: (final context) => const NotFoundScreen(),
          ),
      };
}

import 'package:get_it/get_it.dart';

import '../../../../core/handlers/local_db_handler.dart';
import '../../data/customer_list_data_source/local_customer_list_data_source.dart';
import '../../data/customer_list_repository_impl.dart';
import '../../domain/use_case/get_all_customers_use_case.dart';

class CustomerListInjection {
  static final GetIt customerListGetIt = GetIt.instance;

  static Future<void> init() async {
    customerListGetIt.registerSingleton<LocalDbHandler>(LocalDbHandler());
    customerListGetIt.registerSingleton<LocalCustomerListDataSource>(
      LocalCustomerListDataSource(customerListGetIt<LocalDbHandler>()),
    );
    customerListGetIt.registerSingleton<CustomerListRepositoryImpl>(
      CustomerListRepositoryImpl(
        customerListGetIt<LocalCustomerListDataSource>(),
      ),
    );

    customerListGetIt.registerSingleton<GetAllCustomersUseCase>(
      GetAllCustomersUseCase(
        customerListGetIt<CustomerListRepositoryImpl>(),
      ),
    );
  }
}

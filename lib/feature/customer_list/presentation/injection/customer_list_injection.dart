import 'package:get_it/get_it.dart';

import '../../data/customer_list_data_source/local_customer_list_data_source.dart';
import '../../data/customer_list_repository_impl.dart';
import '../../domain/use_case/get_all_customers_use_case.dart';

class CustomerListInjection {
  static final GetIt customerListGetIt = GetIt.instance;

  static Future<void> init() async {
    customerListGetIt.registerSingleton<LocalCustomerListDataSource>(
      LocalCustomerListDataSource(),
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

import 'package:get_it/get_it.dart';

import '../../../../core/handlers/local_db_handler.dart';
import '../../data/add_customer_repository_impl.dart';
import '../../data/data_source/local_add_customer_data_source.dart';
import '../../domain/use_case/add_customer_use_case.dart';

class AddCustomerScreenInjection {
  static final GetIt addCustomerGetIt = GetIt.instance;

  static Future<void> init() async {
    addCustomerGetIt.registerSingleton<LocalDbHandler>(LocalDbHandler());
    addCustomerGetIt.registerSingleton<LocalAddCustomerDataSource>(
      LocalAddCustomerDataSource(addCustomerGetIt<LocalDbHandler>()),
    );
    addCustomerGetIt.registerSingleton<AddCustomerRepositoryImpl>(
      AddCustomerRepositoryImpl(
        addCustomerGetIt<LocalAddCustomerDataSource>(),
      ),
    );

    addCustomerGetIt.registerSingleton<AddCustomerUseCase>(
      AddCustomerUseCase(
        addCustomerGetIt<AddCustomerRepositoryImpl>(),
      ),
    );
  }
}

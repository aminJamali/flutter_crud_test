import 'package:dartz/dartz.dart';

import '../../../../core/handlers/local_db_handler.dart';
import '../../../../shared/models/exception_model.dart';

class LocalCustomerListDataSource {
  final LocalDbHandler localDbHandler;

  LocalCustomerListDataSource(this.localDbHandler);

  Future<Either<ExceptionModel, Map<String, dynamic>>> getAllCustomers() async {
    await fakeDelay();
    try {
      final customersBox = await localDbHandler.openCustomersBox();

      final Map<String, dynamic> items = await customersBox.getAllValues();
      return Right(items);
    } on Exception {
      return Left(ExceptionModel(message: 'Something went wrong'));
    }
  }

  Future<void> fakeDelay() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

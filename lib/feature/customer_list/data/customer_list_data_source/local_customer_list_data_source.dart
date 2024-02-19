import 'package:dartz/dartz.dart';

import '../../../../core/handlers/local_db_handler.dart';

class LocalCustomerListDataSource with LocalDbHandler {
  Future<Either<Exception, Map<String, dynamic>>> getAllCustomers() async {
    await fakeDelay();
    try {
      final customersBox = await openCustomersBox();

      final Map<String, dynamic> items = await customersBox.getAllValues();
      return Right(items);
    } on Exception {
      return Left(Exception('Something went wrong'));
    }
  }

  Future<void> fakeDelay() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

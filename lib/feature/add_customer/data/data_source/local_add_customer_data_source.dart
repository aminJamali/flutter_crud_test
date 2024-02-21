import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/handlers/local_db_handler.dart';
import '../model/add_customer_dto.dart';

class LocalAddCustomerDataSource with LocalDbHandler {
  Future<Either<Exception, String>> addCustomer(
    AddCustomerDto addCustomerDto,
  ) async {
    try {
      final customerBox = await openCustomersBox();
      final String uuid = const Uuid().v1();
      await customerBox.put(uuid, addCustomerDto.toJson(uuid));

      return Right(uuid);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}

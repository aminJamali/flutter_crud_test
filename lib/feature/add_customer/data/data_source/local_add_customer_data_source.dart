import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/handlers/local_db_handler.dart';
import '../../../../shared/models/exception_model.dart';
import '../model/add_customer_dto.dart';

class LocalAddCustomerDataSource {
  final LocalDbHandler dbHandler;

  LocalAddCustomerDataSource(this.dbHandler);

  Future<Either<ExceptionModel, String>> addCustomer(
    AddCustomerDto addCustomerDto,
  ) async {
    try {
      final customerBox = await dbHandler.openCustomersBox();
      final String uuid = const Uuid().v1();
      await customerBox.put(uuid, addCustomerDto.toJson(uuid));

      return Right(uuid);
    } catch (e) {
      return Left(ExceptionModel(message: e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../../shared/models/exception_model.dart';
import '../../data/model/add_customer_dto.dart';

abstract class AddCustomerRepository {
  Future<Either<ExceptionModel, String>> addCustomer(AddCustomerDto addCustomerDto);
}

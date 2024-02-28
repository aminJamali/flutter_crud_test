import 'package:dartz/dartz.dart';

import '../../../../shared/models/exception_model.dart';
import '../entity/customer_entity.dart';

abstract class CustomerListRepository {
  Future<Either<ExceptionModel, List<CustomerEntity>>> getAllCustomer();
}

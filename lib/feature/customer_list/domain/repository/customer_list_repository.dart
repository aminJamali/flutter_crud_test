import 'package:dartz/dartz.dart';

import '../entity/customer_entity.dart';

abstract class CustomerListRepository {
  Future<Either<Exception, List<CustomerEntity>>> getAllCustomer();
}

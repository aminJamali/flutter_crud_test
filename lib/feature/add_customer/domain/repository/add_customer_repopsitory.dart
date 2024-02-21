import 'package:dartz/dartz.dart';

import '../../data/model/add_customer_dto.dart';

abstract class AddCustomerRepository {
  Future<Either<Exception, String>> addCustomer(AddCustomerDto addCustomerDto);
}

import 'package:dartz/dartz.dart';

import '../domain/repository/add_customer_repopsitory.dart';
import 'data_source/local_add_customer_data_source.dart';
import 'model/add_customer_dto.dart';

class AddCustomerRepositoryImpl extends AddCustomerRepository {
  final LocalAddCustomerDataSource localAddCustomerDataSource;

  AddCustomerRepositoryImpl(this.localAddCustomerDataSource);

  @override
  Future<Either<Exception, String>> addCustomer(
    AddCustomerDto addCustomerDto,
  ) =>
      localAddCustomerDataSource.addCustomer(addCustomerDto);
}

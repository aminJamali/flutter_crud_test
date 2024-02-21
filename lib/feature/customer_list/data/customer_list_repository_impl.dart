import 'package:dartz/dartz.dart';

import '../domain/entity/customer_entity.dart';
import '../domain/repository/customer_list_repository.dart';
import 'customer_list_data_source/local_customer_list_data_source.dart';
import 'models/customer_model.dart';

class CustomerListRepositoryImpl extends CustomerListRepository {
  final LocalCustomerListDataSource localCustomerListDataSource;

  CustomerListRepositoryImpl(this.localCustomerListDataSource);

  @override
  Future<Either<Exception, List<CustomerEntity>>> getAllCustomer() async {
    final result = await localCustomerListDataSource.getAllCustomers();

    return result.fold(
      Left.new,
      (r) {
        final customers = <CustomerModel>[];
        r.forEach((key, value) {
          customers.add(
            CustomerModel.fromJson(value as Map<dynamic, dynamic>),
          );
        });
        return Right(customers);
      },
    );
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../shared/models/exception_model.dart';
import '../entity/customer_entity.dart';
import '../repository/customer_list_repository.dart';

class GetAllCustomersUseCase extends BaseUseCase<List<CustomerEntity>, void> {
  final CustomerListRepository repository;

  GetAllCustomersUseCase(this.repository);

  @override
  Future<Either<ExceptionModel, List<CustomerEntity>>> call(void params) async {
    final result = await repository.getAllCustomer();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}

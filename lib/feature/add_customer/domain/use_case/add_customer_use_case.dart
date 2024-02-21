import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../data/model/add_customer_dto.dart';
import '../repository/add_customer_repopsitory.dart';

class AddCustomerUseCase extends BaseUseCase<String, AddCustomerDto> {
  final AddCustomerRepository addCustomerRepository;

  AddCustomerUseCase(this.addCustomerRepository);

  @override
  Future<Either<Exception, String>> call(AddCustomerDto params) =>
      addCustomerRepository.addCustomer(params);
}

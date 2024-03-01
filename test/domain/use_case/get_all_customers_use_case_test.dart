import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/entity/customer_entity.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/repository/customer_list_repository.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/use_case/get_all_customers_use_case.dart';
import 'package:simple_bloc_app/shared/models/exception_model.dart';

class MockGetAllCustomerRepository extends Mock
    implements CustomerListRepository {}

void main() {
  late GetAllCustomersUseCase getAllCustomersUseCase;
  late MockGetAllCustomerRepository mockGetAllCustomerRepository;

  setUp(
    () {
      mockGetAllCustomerRepository = MockGetAllCustomerRepository();
      getAllCustomersUseCase =
          GetAllCustomersUseCase(mockGetAllCustomerRepository);
    },
  );

  test(
    'Get All Customers use case test',
    () async {
      when(() => mockGetAllCustomerRepository.getAllCustomer()).thenAnswer(
        (_) async => Right(
          _customers,
        ),
      );

      final result = await getAllCustomersUseCase.call(null);

      result.fold(
        (l) => null,
        (r) {
          expect(1, r.length);
        },
      );
    },
  );

  test(
    'Get All Customers use case failure test',
    () async {
      when(() => mockGetAllCustomerRepository.getAllCustomer()).thenAnswer(
        (_) async => Left(
          ExceptionModel(message: 'exception'),
        ),
      );

      final result = await getAllCustomersUseCase.call(null);

      result.fold(
        (l) => expect('exception', l.message),
        (r) => null,
      );
    },
  );
}

final _customers = [
  const CustomerEntity(
    id: '12',
    name: 'amin',
    email: 'aminj@gmail.com',
  ),
];

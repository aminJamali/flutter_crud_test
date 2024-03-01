import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/customer_list/data/customer_list_data_source/local_customer_list_data_source.dart';
import 'package:simple_bloc_app/feature/customer_list/data/customer_list_repository_impl.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/repository/customer_list_repository.dart';
import 'package:simple_bloc_app/shared/models/exception_model.dart';

class MockGetAllCustomersDataSource extends Mock
    implements LocalCustomerListDataSource {}

void main() {
  late MockGetAllCustomersDataSource mockGetAllCustomersDataSource;
  late CustomerListRepository customerListRepository;

  setUp(
    () {
      mockGetAllCustomersDataSource = MockGetAllCustomersDataSource();
      customerListRepository =
          CustomerListRepositoryImpl(mockGetAllCustomersDataSource);
    },
  );

  test(
    'get all customers repository test',
    () async {
      when(
        () => mockGetAllCustomersDataSource.getAllCustomers(),
      ).thenAnswer(
        (_) async => Right(_fakeCustomersMap),
      );

      final result = await customerListRepository.getAllCustomer();

      result.fold(
        (l) => null,
        (r) => expect(2, r.length),
      );
    },
  );

  test(
    'get all customers repository failure test',
    () async {
      when(
        () => mockGetAllCustomersDataSource.getAllCustomers(),
      ).thenAnswer(
        (_) async => Left(ExceptionModel(message: 'error')),
      );

      final result = await customerListRepository.getAllCustomer();

      result.fold(
        (l) => expect('error', l.message),
        (r) => null,
      );
    },
  );
}

final _fakeCustomersMap = <String, dynamic>{
  '1': {
    'id': '1',
    'name': 'amin',
    'email': 'aminj@gmail.com',
  },
  '2': {
    'id': '1',
    'name': 'amin',
    'email': 'aminj@gmail.com',
  },
};

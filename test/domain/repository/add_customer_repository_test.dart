import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/add_customer/data/add_customer_repository_impl.dart';
import 'package:simple_bloc_app/feature/add_customer/data/data_source/local_add_customer_data_source.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/repository/add_customer_repopsitory.dart';
import 'package:simple_bloc_app/shared/models/exception_model.dart';

class MockAddCustomerDataSource extends Mock
    implements LocalAddCustomerDataSource {}

void main() {
  late MockAddCustomerDataSource mockAddCustomerDataSource;
  late AddCustomerRepository addCustomerRepository;

  setUp(
    () {
      mockAddCustomerDataSource = MockAddCustomerDataSource();
      addCustomerRepository =
          AddCustomerRepositoryImpl(mockAddCustomerDataSource);
    },
  );

  test(
    'add customer repository test',
    () async {
      when(
        () => mockAddCustomerDataSource.addCustomer(addCustomerFakeDto),
      ).thenAnswer(
        (_) async => const Right('1'),
      );

      final result =
          await addCustomerRepository.addCustomer(addCustomerFakeDto);

      result.fold(
        (l) => null,
        (r) {
          expect('1', r);
        },
      );
    },
  );

  test(
    'add customer repository failure test',
    () async {
      when(
        () => mockAddCustomerDataSource.addCustomer(addCustomerFakeDto),
      ).thenAnswer(
        (_) async => Left(ExceptionModel(message: 'error')),
      );

      final result =
          await addCustomerRepository.addCustomer(addCustomerFakeDto);

      result.fold(
        (l) => expect('error', l.message),
        (r) => null,
      );
    },
  );
}

final AddCustomerDto addCustomerFakeDto = AddCustomerDto(
  name: 'amin jamali',
  email: 'amin@gmail.com',
);

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/repository/add_customer_repopsitory.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/use_case/add_customer_use_case.dart';
import 'package:simple_bloc_app/shared/models/exception_model.dart';

class MockAddCustomerRepository extends Mock implements AddCustomerRepository {}

void main() {
  late MockAddCustomerRepository mockAddCustomerRepository;
  late AddCustomerUseCase addCustomerUseCase;

  setUp(
    () {
      mockAddCustomerRepository = MockAddCustomerRepository();
      addCustomerUseCase = AddCustomerUseCase(mockAddCustomerRepository);
    },
  );

  test(
    'add customer use case test',
    () async {
      when(() => mockAddCustomerRepository.addCustomer(addCustomerFakeDto))
          .thenAnswer(
        (_) async => const Right(
          '1',
        ),
      );

      final result = await addCustomerUseCase.call(addCustomerFakeDto);

      result.fold(
        (l) => null,
        (r) {
          expect(r, '1');
        },
      );
    },
  );

  test(
    'add customer use case failure test',
    () async {
      when(() => mockAddCustomerRepository.addCustomer(addCustomerFakeDto))
          .thenAnswer(
        (_) async => Left(
          ExceptionModel(message: 'error'),
        ),
      );

      final result = await addCustomerUseCase.call(addCustomerFakeDto);

      result.fold(
        (l) {
          expect('error', l.message);
        },
        (r) => null,
      );
    },
  );
}

final AddCustomerDto addCustomerFakeDto = AddCustomerDto(
  name: 'amin jamali',
  email: 'amin@gmail.com',
);

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/repository/add_customer_repopsitory.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/use_case/add_customer_use_case.dart';

class MockAddCustomerRepository extends Mock implements AddCustomerRepository {}

class MockAddCustomerUseCase extends Mock implements AddCustomerUseCase {}

void main() {
  late MockAddCustomerUseCase mockAddCustomerUseCase;

  setUp(
    () {
      mockAddCustomerUseCase = MockAddCustomerUseCase();
    },
  );

  test(
    'add customer use case test',
    () async {
      when(() => mockAddCustomerUseCase.call(addCustomerDto)).thenAnswer(
        (_) async => const Right(
          '1',
        ),
      );

      final result = await mockAddCustomerUseCase.call(addCustomerDto);

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
      when(() => mockAddCustomerUseCase.call(addCustomerDto)).thenAnswer(
        (_) async => Left(
          Exception('error'),
        ),
      );

      final result = await mockAddCustomerUseCase.call(addCustomerDto);

      result.fold(
        (l) {
          expect('error', l.toString());
        },
        (r) => null,
      );
    },
  );
}

final AddCustomerDto addCustomerDto = AddCustomerDto(
  name: 'amin jamali',
  email: 'amin@gmail.com',
);

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/repository/add_customer_repopsitory.dart';
import 'package:simple_bloc_app/feature/add_customer/domain/use_case/add_customer_use_case.dart';
import 'package:simple_bloc_app/feature/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:simple_bloc_app/feature/add_customer/presentation/bloc/add_customer_state.dart';

class MockAddCustomerRepository extends Mock implements AddCustomerRepository {}

class MockAddCustomerUseCase extends Mock implements AddCustomerUseCase {}

void main() {
  late MockAddCustomerUseCase mockAddCustomerUseCase;
  late AddCustomerBloc addCustomerBloc;

  setUp(
    () {
      mockAddCustomerUseCase = MockAddCustomerUseCase();
      addCustomerBloc = AddCustomerBloc(mockAddCustomerUseCase);
    },
  );

  blocTest<AddCustomerBloc, AddCustomerState>(
    'Emits [AddCustomerLoadingState,AddCustomerLoadedState] when AddCustomerEvent is added',
    build: () {
      when(() => mockAddCustomerUseCase.call(addCustomerDto)).thenAnswer(
        (_) async => const Right(
          '1',
        ),
      );
      return addCustomerBloc;
    },
  );

  blocTest<AddCustomerBloc, AddCustomerState>(
    'Emits [AddCustomerLoadingState,AddCustomerExceptionState] when AddCustomerEvent is added',
    build: () {
      when(() => mockAddCustomerUseCase.call(addCustomerDto)).thenAnswer(
        (_) async => Left(
          Exception('exception'),
        ),
      );
      return addCustomerBloc;
    },
  );
}

final AddCustomerDto addCustomerDto = AddCustomerDto(
  name: 'amin jamali',
  email: 'amin@gmail.com',
);

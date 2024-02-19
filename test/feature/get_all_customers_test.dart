import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/entity/customer_entity.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/repository/customer_list_repository.dart';
import 'package:simple_bloc_app/feature/customer_list/domain/use_case/get_all_customers_use_case.dart';
import 'package:simple_bloc_app/feature/customer_list/presentation/bloc/get_all_customers_bloc.dart';
import 'package:simple_bloc_app/feature/customer_list/presentation/bloc/get_all_customers_event.dart';
import 'package:simple_bloc_app/feature/customer_list/presentation/bloc/get_all_customers_state.dart';

class MockGetAllCustomersUseCase extends Mock
    implements GetAllCustomersUseCase {}

class MockCustomerListRepository extends Mock
    implements CustomerListRepository {}

void main() {
  late GetAllCustomersBloc getAllCustomersBloc;
  late MockGetAllCustomersUseCase mockGetAllCustomersUseCase;

  setUp(
    () {
      mockGetAllCustomersUseCase = MockGetAllCustomersUseCase();
      getAllCustomersBloc = GetAllCustomersBloc(
        getAllCustomersUseCase: mockGetAllCustomersUseCase,
      );
    },
  );

  blocTest<GetAllCustomersBloc, GetAllCustomersState>(
    'emits [GetAllCustomersLoadingState , GetAllCustomersLoadedState] when GetAllCustomerEvent is added',
    build: () {
      when(() => mockGetAllCustomersUseCase.call(null)).thenAnswer(
        (_) async => Right(
          _getAllCustomersSimpleList,
        ),
      );
      return getAllCustomersBloc;
    },
    act: (bloc) => bloc.add(GetAllCustomersEvent()),
    expect: () => [
      GelAllCustomersLoadingState(),
      GetAllCustomersLoadedState(_getAllCustomersSimpleList),
    ],
  );
}

final _getAllCustomersSimpleList = [
  CustomerEntity(id: 1, name: 'Amin Jamali', email: 'amin@gmail.com'),
  CustomerEntity(id: 2, name: 'Reza Ahmadi', email: 'reza@gmail.com'),
];

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/core/handlers/local_db_handler.dart';
import 'package:simple_bloc_app/feature/customer_list/data/customer_list_data_source/local_customer_list_data_source.dart';

class MockDbHandler extends Mock implements LocalDbHandler {}

class MockBoxCollection extends Mock implements CollectionBox<dynamic> {}

void main() {
  late MockDbHandler mockDbHandler;
  late LocalCustomerListDataSource localCustomersListDataSource;
  late MockBoxCollection mockBoxCollection;
  setUp(
    () {
      mockBoxCollection = MockBoxCollection();
      mockDbHandler = MockDbHandler();
      localCustomersListDataSource = LocalCustomerListDataSource(mockDbHandler);
    },
  );

  test(
    'get all customers data source test',
    () async {
      when(
        () => mockBoxCollection.getAllValues(),
      ).thenAnswer(
        (_) async => _customersFakeMap,
      );

      when(
        () => mockDbHandler.openCustomersBox(),
      ).thenAnswer(
        (_) async => mockBoxCollection,
      );

      final result = await localCustomersListDataSource.getAllCustomers();

      result.fold(
        (l) => null,
        (r) => expect(2, r.length),
      );
    },
  );
}

final _customersFakeMap = {
  '1': {
    'id': '1',
    'name': 'amin',
    'email': 'aminj@gmail.com',
  },
  '2': {
    'id': '2',
    'name': 'amin',
    'email': 'aminj@gmail.com',
  },
};

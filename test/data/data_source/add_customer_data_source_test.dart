import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_bloc_app/core/handlers/local_db_handler.dart';
import 'package:simple_bloc_app/feature/add_customer/data/data_source/local_add_customer_data_source.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';

class MockDbHandler extends Mock implements LocalDbHandler {}

class MockBoxCollection extends Mock implements CollectionBox<dynamic> {}

void main() {
  late MockDbHandler mockDbHandler;
  late LocalAddCustomerDataSource localAddCustomerDataSource;
  late MockBoxCollection mockBoxCollection;
  setUp(
    () {
      mockBoxCollection = MockBoxCollection();
      mockDbHandler = MockDbHandler();
      localAddCustomerDataSource = LocalAddCustomerDataSource(mockDbHandler);
    },
  );

  test(
    'add customer data source test',
    () async {
      when(
        () => mockDbHandler.openCustomersBox(),
      ).thenAnswer(
        (_) async => mockBoxCollection,
      );

      final result =
          await localAddCustomerDataSource.addCustomer(_addCustomerFakeDto);

      result.fold(
        (l) => null,
        (r) => expect('1', r),
      );
    },
  );

}

final AddCustomerDto _addCustomerFakeDto = AddCustomerDto(
  name: 'amin jamali',
  email: 'amin@gmail.com',
);

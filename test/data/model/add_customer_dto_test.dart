import 'package:flutter_test/flutter_test.dart';
import 'package:simple_bloc_app/feature/add_customer/data/model/add_customer_dto.dart';

void main() {
  test(
    'add customer dto to json test',
    () {
      final json =
          AddCustomerDto(name: 'amin', email: 'aminj@gmail.com').toJson('1');
      expect(_json, json);
    },
  );
}

final _json = {
  'id': '1',
  'name': 'amin',
  'email': 'aminj@gmail.com',
};

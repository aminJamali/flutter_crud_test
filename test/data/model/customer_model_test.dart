import 'package:flutter_test/flutter_test.dart';
import 'package:simple_bloc_app/feature/customer_list/data/models/customer_model.dart';

void main() {
  late CustomerModel customerModel;

  test(
    'customer model from json test',
    () {
      customerModel = CustomerModel.fromJson(_fakeCustomerJson);

      expect(fakeCustomerModel, customerModel);
    },
  );
}

const CustomerModel fakeCustomerModel =
    CustomerModel(id: '1', name: 'amin', email: 'aminj@gmail.com');

final _fakeCustomerJson = {
  'id': '1',
  'name': 'amin',
  'email': 'aminj@gmail.com',
};

import '../../domain/entity/add_customer_entity.dart';

class AddCustomerDto extends AddCustomerEntity {
  AddCustomerDto({required super.name, required super.email});

  Map<String, dynamic> toJson(final String id) => {
        'email': email,
        'name': name,
        'id': id,
      };
}

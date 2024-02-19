import '../../domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory CustomerModel.fromJson(final Map<String, dynamic> json) =>
      CustomerModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
}

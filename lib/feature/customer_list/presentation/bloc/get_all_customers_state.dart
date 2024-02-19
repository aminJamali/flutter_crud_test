import 'package:equatable/equatable.dart';

import '../../domain/entity/customer_entity.dart';

abstract class GetAllCustomersState extends Equatable {}

class GetAllCustomersLoadedState extends GetAllCustomersState {
  final List<CustomerEntity> customers;

  GetAllCustomersLoadedState(this.customers);

  @override
  List<Object?> get props => [];
}

class GelAllCustomersLoadingState extends GetAllCustomersState {
  @override
  List<Object?> get props => [];
}

class GelAllCustomersExceptionState extends GetAllCustomersState {
  final Exception exception;

  GelAllCustomersExceptionState(this.exception);

  @override
  List<Object?> get props => [];
}

import 'package:equatable/equatable.dart';

import '../../../../shared/models/exception_model.dart';

abstract class AddCustomerState extends Equatable {}

class AddCustomerLoadingState extends AddCustomerState {
  @override
  List<Object?> get props => [];
}

class AddCustomerLoadedState extends AddCustomerState {
  final String id;

  AddCustomerLoadedState(this.id);

  @override
  List<Object?> get props => [];
}

class AddCustomerExceptionState extends AddCustomerState {
  final ExceptionModel exception;

  AddCustomerExceptionState(this.exception);

  @override
  List<Object?> get props => [];
}

class AddCustomerInitialState extends AddCustomerState {
  @override
  List<Object?> get props => [];
}

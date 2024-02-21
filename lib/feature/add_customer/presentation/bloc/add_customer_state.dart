import 'package:equatable/equatable.dart';

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
  final Exception exception;

  AddCustomerExceptionState(this.exception);

  @override
  List<Object?> get props => [];
}

class AddCustomerInitialState extends AddCustomerState {
  @override
  List<Object?> get props => [];
}

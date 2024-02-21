import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/add_customer_use_case.dart';
import 'add_customer_event.dart';
import 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final AddCustomerUseCase addCustomerUseCase;

  AddCustomerBloc(this.addCustomerUseCase) : super(AddCustomerInitialState()) {
    on<AddCustomerEvent>(_onAddCustomerEvent);
  }

  Future<void> _onAddCustomerEvent(
    AddCustomerEvent event,
    Emitter<AddCustomerState> emit,
  ) async {
    emit(AddCustomerLoadingState());
    final result = await addCustomerUseCase.call(event.addCustomerDto);

    result.fold(
      (l) => emit(AddCustomerExceptionState(l)),
      (r) => emit(AddCustomerLoadedState(r)),
    );
  }
}

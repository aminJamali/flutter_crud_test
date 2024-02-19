import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/get_all_customers_use_case.dart';
import 'get_all_customers_event.dart';
import 'get_all_customers_state.dart';

class GetAllCustomersBloc
    extends Bloc<GetAllCustomersEvent, GetAllCustomersState> {
  GetAllCustomersBloc({
    required this.getAllCustomersUseCase,
  }) : super(GelAllCustomersLoadingState()) {
    on<GetAllCustomersEvent>(_onGetAllCustomersEvent);
  }

  final GetAllCustomersUseCase getAllCustomersUseCase;

  Future<void> _onGetAllCustomersEvent(
    GetAllCustomersEvent event,
    Emitter<GetAllCustomersState> emit,
  ) async {
    emit(GelAllCustomersLoadingState());
    final result = await getAllCustomersUseCase.call(null);

    result.fold(
      (l) => emit(GelAllCustomersExceptionState(l)),
      (r) => emit(
        GetAllCustomersLoadedState(r),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';
import '../domain/entity/customer_entity.dart';
import 'bloc/get_all_customers_bloc.dart';
import 'bloc/get_all_customers_event.dart';
import 'bloc/get_all_customers_state.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllCustomersBloc>().add(GetAllCustomersEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Customers List'),
        ),
        body: SafeArea(
          child: BlocConsumer<GetAllCustomersBloc, GetAllCustomersState>(
            listener: (final _, final state) {
              if (state is GelAllCustomersExceptionState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.exception.toString()),
                  ),
                );
              }
            },
            builder: (final _, final state) {
              if (state is GelAllCustomersExceptionState) {
                return _exception(state);
              }
              if (state is GetAllCustomersLoadedState) {
                return _list(state.customers);
              } else {
                return _loading();
              }
            },
          ),
        ),
      );

  Widget _exception(GelAllCustomersExceptionState state) => Center(
        child: Text(state.exception.toString()),
      );

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _list(final List<CustomerEntity> items) => items.isNotEmpty
      ? ListView.builder(
          itemCount: items.length,
          itemBuilder: (final context, final index) => Column(
            children: [
              Text(
                items[index].name,
              ),
              Utils.mediumVerticalSpacer,
              Text(
                items[index].email,
              ),
            ],
          ),
        )
      : const Center(
          child: Text('Nothing to show!'),
        );
}

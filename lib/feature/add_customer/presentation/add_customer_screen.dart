import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';
import '../data/model/add_customer_dto.dart';
import 'bloc/add_customer_bloc.dart';
import 'bloc/add_customer_event.dart';
import 'bloc/add_customer_state.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Customer'),
        ),
        body: SafeArea(
          child: Padding(
            padding: Utils.mediumPadding,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(label: Text('Name')),
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  Utils.mediumVerticalSpacer,
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(label: Text('Email')),
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  Utils.mediumVerticalSpacer,
                  _submit(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _submit(final BuildContext context) =>
      BlocConsumer<AddCustomerBloc, AddCustomerState>(
        listener: (final _, final state) {
          if (state is AddCustomerExceptionState) {
            _onAddCustomerException(state);
          }
          if (state is AddCustomerLoadedState) {
            _onAddCustomerLoaded();
          }
        },
        builder: (final _, final state) => ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<AddCustomerBloc>().add(
                    AddCustomerEvent(
                      AddCustomerDto(
                        name: nameController.text,
                        email: emailController.text,
                      ),
                    ),
                  );
            }
          },
          child: state is AddCustomerLoadingState
              ? const CircularProgressIndicator()
              : const Text('Submit'),
        ),
      );

  void _onAddCustomerException(final AddCustomerExceptionState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(state.exception.toString()),
        ),
      ),
    );
  }

  void _onAddCustomerLoaded() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(
          child: Text('Successfully Submitted!'),
        ),
      ),
    );
    Navigator.pop(context);
  }
}

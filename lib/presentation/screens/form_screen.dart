import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fitness_tracker/domain/entities/form_data_entity.dart';
import 'package:fitness_tracker/domain/repositories/form_repository.dart';
import 'package:fitness_tracker/presentation/cubit/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(FormDataRepository())..loadFormData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Form'),
        ),
        body: SafeArea(
          child: BlocBuilder<FormCubit, FormCubitState>(
              builder: (context, state) {
                if (state is FormLoaded) {
                  return ExpandablePageView.builder(
                  itemCount: state.formFields.length,
                  itemBuilder: (context, pageIndex,) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [state.formFields[pageIndex]].toList().map((field) => _buildFormField(field)).toList()
                      ),
                    );
                  },
                );
                }
                return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }

  Widget _buildFormField(FormFieldData field) {

    switch (field.fieldType) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.label,
          ),
          initialValue: field.initialValue,
        );
      case 'radio':
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(field.label!),
              ...field.options
                  !.map((option) => RadioListTile<String>(
                title: Text(field.name),
                value: field.name,
                groupValue: field.initialValue,
                onChanged: (value) {},
              ))
                  .toList(),
            ],
          );
      default:
        return SizedBox.shrink();
    }
  }

}

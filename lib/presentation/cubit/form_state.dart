part of 'form_cubit.dart';

abstract class FormCubitState extends Equatable{
  const FormCubitState();
}


class FormInitial extends FormCubitState {
  @override
  List<Object> get props => [];
}

class FormLoading extends FormCubitState {
  @override
  List<Object> get props => [];
}


class FormLoaded extends FormCubitState {

  final List<FormFieldData> formFields;

  const FormLoaded({ this.formFields = const [] });

  @override
  List<Object> get props => [];
}



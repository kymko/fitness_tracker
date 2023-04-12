import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_tracker/domain/entities/form_data_entity.dart';
import 'package:fitness_tracker/domain/repositories/form_repository.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  final FormDataRepository _repository;

  FormCubit(this._repository) : super(FormInitial());


  void loadFormData() async {
    try {

      emit(FormLoading());

      final formData = await _repository.getFormData();

      List<FormFieldData> fields = formData['fields']
          .map<FormFieldData>((element) => FormFieldData.fromJson(element))
          .toList();

      emit(FormLoaded(formFields: fields));

    } catch (e) {
      // handle error
    }
  }

  // void goToNextPage() {
  //   final currentPageIndex = state.currentPageIndex;
  //   if (currentPageIndex < state.formFields.length - 1) {
  //     emit(state.copyWith(currentPageIndex: currentPageIndex + 1));
  //   }
  // }
  //
  // void goToPreviousPage() {
  //   final currentPageIndex = state.currentPageIndex;
  //   if (currentPageIndex > 0) {
  //     emit(state.copyWith(currentPageIndex: currentPageIndex - 1));
  //   }
  // }


}
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileFormBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(name: 'firstName', validators: []);
  final documentNumber = TextFieldBloc(name: 'documentNumber', validators: []);
  final phone = TextFieldBloc(name: 'phone', validators: []);
  final email = TextFieldBloc(name: 'email', validators: []);

  @override
  void onSubmitting() {}

  ProfileFormBloc() {
    addFieldBlocs(fieldBlocs: [firstName, documentNumber, phone, email]);
  }

  void dispose() {
    firstName.close();
    documentNumber.close();
    phone.close();
    email.close();
  }
}

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_widgets/common_success_dialog.dart';
import 'package:potatoes_test/app_widgets/loading_dialog.dart';
import 'package:potatoes_test/jwt.dart';
import 'package:potatoes_test/profile/mutations/update_profile_mutation.dart';
import 'package:potatoes_test/profile/profile_controller.dart';
import 'package:potatoes_test/profile/queries/getProfile.dart';

class ProfileFormBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(name: 'firstName', validators: []);
  final documentNumber = TextFieldBloc(name: 'documentNumber', validators: []);
  final phone = TextFieldBloc(name: 'phone', validators: []);
  final email = TextFieldBloc(name: 'email', validators: []);
  final password = TextFieldBloc(name: 'password', validators: []);

  ProfileFormBloc() {
    print('xx');
    addFieldBlocs(
        fieldBlocs: [firstName, documentNumber, phone, email, password]);
    init();
  }

  void init() async {
    final _client = Get.find<GraphQLClient>();
    final result = await _client.query(QueryOptions(
      document: getProfileQueryDoc,
      fetchPolicy: FetchPolicy.cacheFirst,
    ));
    final resp = Jwt.token;
    print('rr $result');
    print(resp);
    final _request = QueryOptions(
            document: getProfileQueryDoc, fetchPolicy: FetchPolicy.cacheFirst)
        .asRequest;
    print("_reqest");
    print(_request);
    final _getMyInfoJson = _client.readQuery(_request);
    print('RES');
    print(_getMyInfoJson);
    // firstName.updateValue(value)
    firstName.updateValue(_getMyInfoJson['getProfile']['cliente']['nombre']);
    email.updateValue(
        _getMyInfoJson['getProfile']['cliente']['usuario']['email']);
    documentNumber.updateValue(_getMyInfoJson['getProfile']['cliente']['dni']);
    phone.updateValue(
        _getMyInfoJson['getProfile']['cliente']['telefono'].toString());
  }

  @override
  void onSubmitting() async {
    print(firstName.value);
    print(documentNumber.value);
    print(phone.value);
    print(email.value);
    ProfileController.to.firstName.value = firstName.value;

    final _client = Get.find<GraphQLClient>();
    final result = await _client.mutate(
      MutationOptions(
        document: updateProfileDoc,
        variables: {
          'nombre ': firstName.value,
          'dni': documentNumber.value,
          'telefono': phone.value
        },
        update: (cache, result) {
          print("RESULTTT $result");
          final _request = QueryOptions(
                  document: getProfileQueryDoc,
                  fetchPolicy: FetchPolicy.networkOnly)
              .asRequest;
          final _getMyInfoJson = cache.readQuery(_request);
          cache.writeQuery(_request, data: _getMyInfoJson);
          print("RES ${result.data}");
          ProfileController.to.firstName.value =
              result.data['updateClientProfile']['nombre'];
        },
        onError: (error) {
          print(error);
        },
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }
    LoadingDialog.hide();
    await CommonSuccessDialog.show(
        messageText: 'Cambios guardados', acceptText: 'Aceptar');
  }

  void dispose() {
    firstName.close();
    documentNumber.close();
    phone.close();
    email.close();
    password.close();
  }
}

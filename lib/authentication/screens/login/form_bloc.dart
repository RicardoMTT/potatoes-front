import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_routing/routes.dart';
import 'package:potatoes_test/app_widgets/common_alert_dialog.dart';
import 'package:potatoes_test/app_widgets/common_success_dialog.dart';
import 'package:potatoes_test/app_widgets/loading_dialog.dart';
import 'package:potatoes_test/authentication/mutations/login.dart';
import 'package:potatoes_test/jwt.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(name: 'email', validators: []);
  final password = TextFieldBloc(name: 'password', validators: []);
  @override
  Future<void> onSubmitting() async {
    LoadingDialog.show();
    emitSuccess(canSubmitAgain: true);

    final _client = Get.find<GraphQLClient>();
    await _client.mutate(
      MutationOptions(
        document: loginMutationDoc,
        variables: {'identifier': email.value, 'password': password.value},
        onError: (error) {
          print(error);

          print(error.graphqlErrors[0]);
          print(error.graphqlErrors[0].message);
          LoadingDialog.hide();
          if (error.graphqlErrors[0].extensions['exception']['data']['message']
                  [0]['messages'][0]['id'] ==
              'Auth.form.error.invalid') {
            AppAlertDialog.show(
                contentText: 'El correo y/o contraseña es incorrecta.');
          } else if (error.graphqlErrors[0].message ==
              'Auth.form.error.blocked') {
            AppAlertDialog.show(
                contentText:
                    'Su cuenta se encuentra suspendida. Contacte con el servicio técnico.');
          } else {
            AppAlertDialog.show(
                contentText:
                    'Ocurrió un error desconocido al iniciar sesión. Por favor inténtelo nuevamente.');
          }
        },
        update: (cache, result) async {
          if (!result.hasException || result.data != null) {
            print(result);
            final _jwt = result.data['login']['jwt'];
            print(_jwt);
            Jwt.token = _jwt;
            final _confirm = await CommonSuccessDialog.show(
                messageText: 'Inicio sesión correctamente',
                acceptText: 'Aceptar');
            if (_confirm) {
              Get.offAllNamed(AppRoutes.tabs);
              return;
            }
          }
        },
      ),
    );
  }

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [email, password]);
  }

  void dispose() {
    email.close();
    password.close();
  }
}

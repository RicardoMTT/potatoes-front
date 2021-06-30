import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_routing/routes.dart';
import 'package:potatoes_test/authentication/mutations/login.dart';
import 'package:potatoes_test/jwt.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(name: 'email', validators: []);
  final password = TextFieldBloc(name: 'password', validators: []);
  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
    Get.offAllNamed(AppRoutes.tabs);

    final _client = Get.find<GraphQLClient>();
    await _client.mutate(
      MutationOptions(
        document: loginMutationDoc,
        variables: {'identifier': email.value, 'password': password.value},
        onError: (error) {},
        update: (cache, result) {
          if (!result.hasException || result.data != null) {
            final _jwt = result.data['login']['jwt'];
            Jwt.token = _jwt;
            Get.offAllNamed(AppRoutes.tabs);
            return;
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

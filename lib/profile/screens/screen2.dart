import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/common_text_field.dart';
import 'package:potatoes_test/profile/screens/form_bloc.dart';

class Prueba extends StatelessWidget {
  const Prueba({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileFormBloc(),
      child: Builder(
        builder: (context) {
          final _formBloc = BlocProvider.of<ProfileFormBloc>(context);
          return Column(
            children: [
              CommonTextField(
                keyBoardType: TextInputType.text,
                textFieldBloc: _formBloc.firstName,
                placeholder: "Nombre y apellido",
                icon: Icons.person,
              ),
              SizedBox(
                height: 10,
              ),
              CommonTextField(
                keyBoardType: TextInputType.number,
                textFieldBloc: _formBloc.documentNumber,
                placeholder: "DNI",
                icon: Icons.domain_verification_outlined,
              ),
              SizedBox(
                height: 10,
              ),
              CommonTextField(
                  keyBoardType: TextInputType.number,
                  textFieldBloc: _formBloc.phone,
                  placeholder: "Teléfono",
                  icon: Icons.phone),
              SizedBox(
                height: 10,
              ),
              CommonTextField(
                keyBoardType: TextInputType.emailAddress,
                textFieldBloc: _formBloc.email,
                placeholder: "email",
                icon: Icons.email,
              ),
              SizedBox(
                height: 10,
              ),
              CommonTextField(
                keyBoardType: TextInputType.visiblePassword,
                textFieldBloc: _formBloc.password,
                placeholder: "Contraseña",
                icon: Icons.keyboard,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: kPrimaryColor,
                  onPressed: () {
                    _formBloc.onSubmitting();
                  },
                  child: Text('Guardar cambios'),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
    );
  }
}

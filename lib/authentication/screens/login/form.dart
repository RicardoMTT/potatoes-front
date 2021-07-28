import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/common_text_field.dart';
import 'package:potatoes_test/authentication/screens/login/form_bloc.dart';

class LoginScreenForm extends StatelessWidget {
  const LoginScreenForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginFormBloc>(
      create: (_) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final _formBloc = BlocProvider.of<LoginFormBloc>(context);
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/images/login/planta.png',
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CommonTextField(
                      keyBoardType: TextInputType.emailAddress,
                      textFieldBloc: _formBloc.email,
                      icon: Icons.email,
                    )
                    //  TextField(
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Email',
                    //       hintText: 'Enter valid email id as abc@gmail.com'),
                    // ),
                    ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CommonTextField(
                      keyBoardType: TextInputType.visiblePassword,
                      textFieldBloc: _formBloc.password,
                      isPassword: true,
                      icon: Icons.paste,
                    )
                    //  TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Password',
                    //       hintText: 'Enter secure password'),
                    // ),
                    ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    _formBloc.submit();
                  },
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

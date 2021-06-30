import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CommonTextField extends StatefulWidget {
  final TextInputType keyBoardType;
  final TextFieldBloc textFieldBloc;

  const CommonTextField({Key key, this.keyBoardType, this.textFieldBloc})
      : super(key: key);
  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final _key = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> get inputKey => _key;
  @override
  Widget build(BuildContext context) {
    final _errorStyle = TextStyle(color: Theme.of(context).errorColor);

    return BlocBuilder(
      cubit: widget.textFieldBloc,
      builder: (context, FieldBlocState state) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: TextFieldBlocBuilder(
              key: _key,
              textFieldBloc: widget.textFieldBloc,
              keyboardType: widget.keyBoardType,
              errorBuilder: (context, error) => null,
            ),
          )
        ],
      ),
    );
  }
}
